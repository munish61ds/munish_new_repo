@extends('layouts.master')
@section('title','Instructor results')
@section('parentPageTitle', 'Test')
@section('css-link')
    @include('layouts.include.form.form_css')
@stop
@section('page-style')
@stop
@section('content')
    @if(request()->is('dashboard/evaluation-test/instructor-results/list'))
        <div class="card m-b-30">
            <h4 class="card-header">@translate(Instructors whose taken the tests (Results))</h4>
            <div class="card-body mx-3">
                <table class="table table-striped- table-bordered table-hover text-center">
                    <thead>
                    <tr>
                        <th>S/L</th>
                        <th>@translate(Instructor name)</th>
                        <th>@translate(Evaluation Test)</th>
                        <th>@translate(Instructor degree)</th>
                        <th>@translate(Eligible)</th>
                    </tr>
                    </thead>
                    <tbody class="text-left">
                    @forelse($results as  $item)
                        <tr>
                            <td class="text-center">{{ ($loop->index+1) + ($results->currentPage() - 1)*$results->perPage() }}</td>

                            <td>
                            	Instructor name: {{$item->user->name}}<br>
                            	{{$item->user->email}}
                            </td>
                            <td>
                            	Test name: {{ $item->test->name }}<br>
                            	Test Category: {{ $item->test->category->name }}<br>
                            	Pass marks: {{ $item->test->pass_mark }}<br>
                            	Test time: {{ $item->test->test_time }} (Minutes)<br>
                            </td>
                            <td class="text-center">
                            	@php
                            		$correct_question_count = 0;
                            		$total_questions = 0;
	                            	foreach(json_decode($item->results) as $_item) {
	                        			if($_item->is_corr) {
	                        				$correct_question_count++;
	                        			}
	                            		$total_questions++;
	                            	}
                            	@endphp
                            	<span>{{ $correct_question_count }} of {{ $total_questions }} passed</span>
                            </td>
                            <td class="text-center">
                                <div class="switchery-list">
                                	@php
                                		$eligible_status = false;
                                		if($item->attributes != null && json_decode($item->attributes)->eligible == true) {
                                			$eligible_status = true;
                                		}
                                	@endphp
                                    <input type="checkbox" data-url="{{route('evaluation-test.instructor-results.update_eligible')}}"
                                           data-id="{{$item->id}}"
                                           class="js-switch-success"
                                           id="category-switch" {{ $eligible_status ? 'checked' : null}} />
                                </div>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="5"><h3 class="text-center">@translate(No Data Found)</h3></td>
                        </tr>
                    @endforelse
                    </tbody>
                    <div class="float-left">
                        {{ $results->links() }}
                    </div>
                </table>
            </div>
        </div>
    @endif
@endsection
@section('js-link')
    @include('layouts.include.form.form_js')
@stop
@section('page-script')
    <script type="text/javascript" src="{{ asset('assets/js/custom/course.js') }}"></script>
@stop
