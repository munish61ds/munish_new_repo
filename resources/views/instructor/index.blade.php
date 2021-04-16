@extends('layouts.master')
@section('title','Instructor List')
@section('parentPageTitle', 'All Student')
@section('content')
<div class="card mx-2 mb-3">
    <div class="card-header">
        <div class="float-left">
            <h3>@translate(All Instructors)</h3>
        </div>
        <div class="float-right">
            <div class="row">
                <div class="col">
                    <form method="get" action="">
                        <div class="input-group">
                            <input type="text" name="search" class="form-control col-12" placeholder="@translate(Search by name)" value="{{Request::get('search')}}">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="submit">
                                    @translate(Search)</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="card-body table-responsive">
        <table class="table table-hover table-bordered">
            <thead>
                <tr class="text-center">
                    <th>S/L</th>
                    <th>@translate(Avatar)</th>
                    <th>@translate(Main info)</th>
                    {{-- <th>@translate(Address info)</th> --}}
                    <th>@translate(Qualification info)</th>
                    <th>@translate(Balance)</th>
                    <th>@translate(Evaluation test)</th>
                    <th>@translate(Type)</th>
                    <th>@translate(Action)</th>
                </tr>
            </thead>
            <tbody class="text-center">
                @forelse($instructors as $item)
                <tr>
                    <td>{{ ($loop->index+1) + ($instructors->currentPage() - 1)*$instructors->perPage() }}</td>
                    <td class="text-center">
                      @if($item->image != null)
                          <img src="{{filePath($item->image)}}" class="img-thumbnail rounded-circle avatar-lg"><br />
                        @else
                            <img src="" class="img-thumbnail rounded-circle avatar-lg" alt="avatar"><br />
                        @endif
                    </td>
                    <td class="text-left">
                    	<b>{{$item->email ?? 'N/A'}}</b><br>
                    	{{ $item->p_name ?? $item->name }}
                    	{{ $item->p_gender }}
                    	{{ $item->p_phone_number ?? $item->phone }}
                    	{{ $item->p_dob }}
                    </td>
                    {{-- <td class="text-left">
                    	{{ $item->p_state }}
                    	{{ $item->p_pin_code }}
                    	{{ $item->p_city }}
                    	{{ $item->p_sub_address1 }}
                    	{{ $item->p_sub_address2 }}
                    </td> --}}
                    <td class="text-left">
                    	{!! $item->p_qualifications !!}
                    	<hr style="margin: 5px">
                    	{!! $item->p_work_experience !!}
                    </td>
                    <td>{{formatPrice($item->balance)}}
                    </td>
                    <td>
                    	@if($item->evaluation_test)
                    		<span class="text-success">Taken</span>
                    	@else
                    		<span class="text-wanring">Not taken</span>
                    	@endif
                    </td>
                    <td>
                    	<div class="switchery-list">
                    		basic
                            <input type="checkbox" data-url="{{route('instructors.update_type')}}"
                                   data-id="{{$item->id}}"
                                   class="js-switch-success mr-2 ml-2"
                                   id="category-switch" {{$item->type == 'pro' ? 'checked' : null}} />
                            pro
                        </div>
                    </td>
                    <td>
                        <div class="kanban-menu">
                            <div class="dropdown">
                                <button class="btn btn-link p-0 m-0 border-0 l-h-20 font-16" type="button" id="KanbanBoardButton1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="feather icon-more-vertical-"></i></button>
                                <div class="dropdown-menu dropdown-menu-right action-btn" aria-labelledby="KanbanBoardButton1" x-placement="bottom-end">
                                    <a class="dropdown-item" href="{{ route('instructors.show', $item->user_id) }}">
                                        <i class="feather icon-edit-2 mr-2"></i>
                                        @translate(Details)</a>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                @empty
                    <tr></tr>
                    <tr></tr>
                <tr>
                    <td><h3 class="text-center">No Data Found</h3></td>
                </tr>
                    <tr></tr>
                    <tr></tr>
                    <tr></tr>
                @endforelse
            </tbody>
            <div class="float-left">
                {{ $instructors->links() }}
            </div>
        </table>
    </div>
</div>

@endsection
