<?php

namespace App\Http\Controllers\Module\EvaluationTest;

use Alert;
use App\EvaluationTest;
use App\EvaluationTestCategory;
use App\Http\Controllers\Controller;
use App\Model\Category;
use App\Model\Course;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class CategoryController extends Controller
{

    public function __construct()
    {
        $this->middleware('authenticated:Admin');
    }

    //show all category and search here
    public function index(Request $request)
    {
        $categories = null;
        if ($request->get('search')) {
            $search = $request->search;
            $categories = EvaluationTestCategory::where('name', 'like', '%' . $search . '%')
                ->paginate(10);
        } else {
            $categories = EvaluationTestCategory::paginate(10);
        }
        return view('module.evaluation_test.category.index', compact('categories'));
    }

    //create category model
    public function create()
    {
        $categories = EvaluationTestCategory::get();
        return view('module.evaluation_test.category.create', compact('categories'));
    }

    //store the category
    public function store(Request $request)
    {

        if (env('DEMO') === "YES") {
        Alert::warning('warning', 'This is demo purpose only');
        return back();
      }

        $request->validate([
            'name' => 'required'
        ], [
            'name.required' => translate('Category name is required')
        ]);
        $category = new EvaluationTestCategory();
        $category->name = $request->name;
        $category->slug = Str::slug($request->name);

        //store the icon
        if ($request->has('icon')) {
            $category->icon = $request->icon;
        }
        $category->save();
        notify()->success(translate('Category created successfully'));
        return back();
    }

    //edit category model
    public function edit($id)
    {
        $category = EvaluationTestCategory::findOrFail($id);
        $categories = EvaluationTestCategory::get();
        return view('module.evaluation_test.category.edit', compact('category', 'categories'));
    }

    //update the category
    public function update(Request $request)
    {

        if (env('DEMO') === "YES") {
        Alert::warning('warning', 'This is demo purpose only');
        return back();
      }

        $request->validate([
            'name' => 'required'
        ], [
            'name.required' => translate('Category name is required')
        ]);


        $update_category = EvaluationTestCategory::where('id', $request->id)->first();
        $update_category->name = $request->name;
        $update_category->slug = Str::slug($update_category->name) . $update_category->id;
        $update_category->icon = $request->icon;
        $update_category->save();

        notify()->success(translate('Category updated successfully'));
        return back();
    }

    //soft delete the category
    public function destroy($id)
    {

        if (env('DEMO') === "YES") {
        Alert::warning('warning', 'This is demo purpose only');
        return back();
      }

        $questions = EvaluationTest::where('category_id', $id)->count();
        if ($questions <= 0) {
            EvaluationTestCategory::where('id', $id)->delete();
            notify()->success(translate('Category deleted successfully'));
            return back();
        } else {
            notify()->info(translate('This category already in used.'));
            return back();
        }

    }
}
