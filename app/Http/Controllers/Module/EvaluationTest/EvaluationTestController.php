<?php

namespace App\Http\Controllers\Module\EvaluationTest;

use Alert;
use App\EvaluationTest;
use App\EvaluationTestCategory;
use App\EvaluationTestQuestion;
use App\EvaluationTestResult;
use App\Http\Controllers\Controller;
use App\Model\Demo;
use App\Model\Instructor;
use App\User;
use Auth;
use Carbon\Carbon;
use Hashids\Hashids;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;
use Illuminate\View\View;


class EvaluationTestController extends Controller
{
	public function __construct() {
		$this->middleware('authenticated:Admin', [
            'only' => [
            	'create', 'store', 'edit', 'update', 'delete',
            	'questionsIndex', 'questionsStore', 'questionsPublished', 'questionsDelete', 'questionsEdit', 'questionsUpdate',
            	'instructorResultList'
            ]
        ]);
	}

    // List & Create
    public function create()
    {
        $test = EvaluationTest::where('user_id', Auth::id())->paginate(10);
        $categories = EvaluationTestCategory::get();
        return view('module.evaluation_test.test.index', compact('test', 'categories'));
    }

    /*store */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'pass_mark' => 'required',
        ]);
        $test = new EvaluationTest();
        $test->name = $request->name;
        $test->test_time = $request->test_time;
        $test->pass_mark = $request->pass_mark;
        $test->status = $request->status;
        $test->user_id = Auth::id();
        $test->category_id = $request->category_id;
        $test->save();
        notify()->success(translate('Evaluation Test Create Successful Done'));
        return back();
    }

    /*edit EvaluationTest*/
    public function edit($id)
    {
        $test = EvaluationTest::where('id', $id)->first();
        $categories = EvaluationTestCategory::get();
        return view('module.evaluation_test.test.edit', compact('test', 'categories'));
    }

    /*EvaluationTest update*/
    public function update(Request $request)
    {
        $test = EvaluationTest::where('id', $request->id)->first();
        $test->name = $request->name;
        $test->test_time = $request->test_time;
        $test->pass_mark = $request->pass_mark;
        $test->status = $request->status;
        $test->user_id = Auth::id();
        $test->category_id = $request->category_id;
        $test->save();
        notify()->success(translate('Evaluation Test Update Successful Done'));
        return back();
    }

    /*EvaluationTest delete*/
    public function delete($id)
    {
        $test = EvaluationTest::where('id', $id)->first();
        $test->delete();
        notify()->success(translate('Evaluation Test Delete Successful Done'));
        return back();
    }

    /*questions*/
    public function questionsIndex($id)
    {
        $test = EvaluationTest::where('id', $id)->first();
        $questions = EvaluationTestQuestion::where('test_id', $test->id)->get();
        return view('module.evaluation_test.test.questionsIndex', compact('test', 'questions'));
    }

    /*questions store*/
    public function questionsStore(Request $request)
    {
        $i = 0;
        $answer_collection = collect();
        foreach ($request->answer as $answer) {
            $data = rand(1000, 1000000);
            $demo = new Demo();
            $demo->image = $request->image[$i] ?? null;
            $demo->index = $data;
            $demo->correct = $request->correct[$i];
            $demo->answer = $answer;
            if ($demo->image != null) {
                //upload the image
                $demo->image = fileUpload($request->image[$i], 'test');
            }
            $i++;
            $answer_collection->push($demo);

        }

        $question = new EvaluationTestQuestion();
        $question->question = $request->title;
        $question->test_id = $request->test_id;
        $question->user_id = Auth::id();
        $question->grade = $request->grade;
        $question->options = json_encode($answer_collection);
        $question->save();
        notify()->success(translate('Questions Create Successful'));
        return back();
    }


    //published
    public function questionsPublished(Request $request)
    {
        // don't use this type of variable naming, use $category instead of $cat1
        $question = EvaluationTestQuestion::where('id', $request->id)->first();
        if ($question->status == 1) {
            $question->status = 0;
            $question->save();
        } else {
            $question->status = 1;
            $question->save();
        }
        return response(['message' => translate('Question status is changed')], 200);
    }

    /*questions delete*/
    public function questionsDelete($id)
    {
        $question = EvaluationTestQuestion::where('id', $id)->first();
        $question->delete();
        notify()->success(translate('Question Delete Successful Done'));
        return back();
    }

    /*questions edit*/
    public function questionsEdit($id)
    {
        $question = EvaluationTestQuestion::where('id', $id)->first();
        return view('module.evaluation_test.test.questionsEdit', compact('question'));
    }

    public function questionsUpdate(Request $request)
    {
        $i = 0;
        $answer_collection = collect();
        foreach ($request->answer as $answer) {
            $data = $request->index[$i];
            $demo = new Demo();
            $demo->image = $request->image[$i] ?? null;
            $demo->index = $data;
            $demo->correct = $request->correct[$i];
            $demo->answer = $answer;
            if ($demo->image != null) {
                //upload the image
                $demo->image = fileUpload($request->image[$i], 'test');
            }
            $i++;
            $answer_collection->push($demo);
        }

        $question = EvaluationTestQuestion::where('id', $request->id)->first();
        $question->question = $request->title;
        $question->grade = $request->grade;
        $question->status = $request->status;
        $question->options = json_encode($answer_collection);
        $question->save();
        notify()->success(translate('Questions Update Successful'));
        return back();
    }

    public function instructorResultList() {
    	$results = EvaluationTestResult::with('user', 'test', 'test.category')->paginate(10);
        return view('module.evaluation_test.instructor_results.index', compact('results'));
    }

    public function updateEligible(Request $request) {
        $test = EvaluationTestResult::where('id', $request->id);

    	if($test->first()->attributes == null) {
    		$test = $test->first();
    		$test->attributes = json_encode([
    			'eligible' => 1
    		]);
    		$test->save();
    	} else if (json_decode($test->first()->attributes)->eligible == 1) {
            $test->update(['attributes->eligible' => 0]);
        } else {
            $test->update(['attributes->eligible' => 1]);
        }

        return response(['message' => translate('Eligible status is updated')], 200);
    }


    /* Frontend -------- */

    protected function get_current_test() {
    	return EvaluationTest::where('status', 1)->first();
    }

    protected function get_evaluation_test_time() {
    	$current_test = $this->get_current_test();
    	$test_time = $current_test->test_time;
    	return $test_time;
    }

    protected function get_evaluation_test_questions() {
    	$current_test = $this->get_current_test();
    	$question_collection = EvaluationTestQuestion::where('test_id', $current_test->id)
    		->select([
    			'id',
    			'question as content',
    			'options as answers',
    		])->get()->toArray();

    	$questions = [];
    	foreach ($question_collection as $key => $item) {
    		$answer_collection = json_decode($item['answers']);
    		$correct_answer = 0;
    		$answers = [];
    		foreach ($answer_collection as $key => $ans) {
    			if($ans->correct == 'true') {
    				$correct_answer = $key+1;
    			}
    			$answers[] = $ans->answer;
    		}
    		$questions[] = [
    			'id' => $item['id'],
    			'content' => $item['content'],
    			'correct_answer' => $correct_answer,
    			'answers' => $answers,
    		];
    	}

    	return $questions;
    }

    public function evaluationTest(Request $request) {
    	if($request->h != null && $request->ui != null) {
    		if(\Hash::check('Languafina_hashing', $request->h)) {
    			// $hashids = new Hashids('hashing_instructor_activation_case');
        		// $user_id = $hashids->decode($request->ui);
        		$user_id = $request->ui;
        		if($user_id != null && $user_id > 0) {
        			User::where('id', $user_id)->update([
        				'verified' => 1
        			]);
    				\Session::flash('message', 'Thank you, your email has been verified.');
        		}
    		}
    	}
    	if(!\Auth()->check()) {
    		\Session::flash('evaluation_test_flash', 'Please login first before taking the evaluation test.');
    		return redirect()->route('login');
    	}
    	$user = \Auth()->user();
    	if($user->user_type != 'Instructor') {
    		return redirect()->route('homepage');
    	}
    	$ins = Instructor::where('user_id', $user->id)->first();
    	if($ins->evaluation_test == 1) {
    		return redirect()->route('dashboard');
    	}

    	$current_test = $this->get_current_test();
    	if($current_test != null) {
	    	Session::put('current_test_id', $current_test->id);

	    	$questions = $this->get_evaluation_test_questions();
	    	$time = $this->get_evaluation_test_time(); // in minutes
	    	return view('instructor.evaluation_test')->with([
	    		'questions_count' => count($questions),
	    		'questions' => $questions,
	    		'time' => $time,
	    	]);
    	} else {
    		// There're no actived evaulation tests
    		echo "There're no actived evaulation tests, Please contact with support section.";
    		echo "<br><a href='". route('homepage') ."'>Back to homepage</a>";
    	}
    }

    public function evaluationTestPost(Request $request) {
    	$questions = $this->get_evaluation_test_questions();
    	$result = [];
    	foreach ($request->ans as $question_id => $answer_id) {
    		foreach ($questions as $key => $question) {
    			if($question['id'] == $question_id) {
    				if($answer_id == $question['correct_answer']) {
    					$result[] = [
    						'q_id' => $question_id,
    						'is_corr' => true,
    					];
    				} else {
    					$result[] = [
    						'q_id' => $question_id,
    						'is_corr' => false,
    					];
    				}
    			}
    		}
    	}

    	$etr = new EvaluationTestResult;
    	$etr->user_id = Auth()->user()->id;
    	$etr->test_id = Session::get('current_test_id');
    	$etr->results = json_encode($result);
    	$etr->save();

    	// update evaluation test status case
    	$ins = Instructor::where('user_id', Auth()->user()->id)->first();
    	$ins->evaluation_test = 1;
    	$ins->save();

    	Session::flash('evaluation_test_done', true);
    	return redirect()->route('instructor.evaluation_test_done');
    }

    public function evaluationTestDone() {
    	if(Session::has('evaluation_test_done')){
    		return view('instructor.evaluation_test_done');
    	} else {
    		return redirect()->route('homepage');
    	}
    }
}

