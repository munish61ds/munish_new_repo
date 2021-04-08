<?php

namespace App\Http\Controllers\Module;

use App\Http\Controllers\Controller;
use App\Faq;
use Illuminate\Http\Request;
use Alert;

class FaqController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    // faq list
    public function index()
    {
        $faqs = Faq::all();
        return view('module.faq.index', compact('faqs'));
    }
    // faq create form
    public function create()
    {
        return view('module.faq.create');
    }
    // faq store
    public function store(Request $request)
    {

        if (env('DEMO') === "YES") {
        Alert::warning('warning', 'This is demo purpose only');
        return back();
      }


        $faq = new Faq();
        $faq->question = $request->question;
        $faq->answer = $request->answer;
        $faq->type = $request->type;
        $faq->save();

        notify()->success(translate('Faq created successfully'));
        return back();
    }

    // faq edit
    public function edit($id)
    {
        $faq = Faq::findOrFail($id);
        return view('module.faq.edit', compact('faq'));
    }

    // faq update
    public function update(Request $request)
    {

        if (env('DEMO') === "YES") {
        Alert::warning('warning', 'This is demo purpose only');
        return back();
      }


        $faq = Faq::findOrFail($request->id);
        $faq->question = $request->question;
        $faq->answer = $request->answer;
        $faq->type = $request->type;
        $faq->save();
        notify()->success(translate('Faq updated successfully'));
        return back();
    }

    // faq destroy
    public function destroy($id)
    {

        if (env('DEMO') === "YES") {
        Alert::warning('warning', 'This is demo purpose only');
        return back();
      }

        $faq = Faq::findOrFail($id);
        $faq->delete();
        notify()->success(translate('Faq deleted successfully'));
        return back();
    }
}
