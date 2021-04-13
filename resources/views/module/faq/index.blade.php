@extends('layouts.master')
@section('title','Faq')
@section('parentPageTitle', 'All Faqs')
@section('content')
    <div class="card m-2">
        <div class="card-header">
            <div class="float-left">
                <h2 class="card-title">@translate(Faq List)</h2>
            </div>
            <div class="float-right">
                <div class="row">
                    <div class="col">
                        <a href="#!" onclick="forModal('{{ route("faqs.create") }}', '@translate(Faq Create)')"
                           class="btn btn-primary">
                            <i class="la la-plus"></i>
                            @translate(Add New Faq)
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="card-body">
            <table class="table table-striped- table-bordered table-hover">
                <thead class=" text-center">
                <tr>
                    <th>S/L</th>
                    <th width="250px">@translate(Question)</th>
                    <th>@translate(Answer)</th>
                    <th>@translate(Type)</th>
                    <th>@translate(Action)</th>
                </tr>
                </thead>
                <tbody>
                @forelse($faqs as  $item)
                    <tr>
                        <td class=" text-center">{{ ($loop->index+1) }}</td>
                        <td class=" text-left">{{ $item->question ?? 'N/A' }}</td>
                        <td class=" text-left">{!! $item->answer ?? 'N/A' !!}</td>
                        <td class=" text-left">{!! str_replace('_', ' ', $item->type) ?? 'N/A' !!}</td>
                        <td>
                            <div class="kanban-menu">
                                <div class="dropdown">
                                    <button class="btn btn-link p-0 m-0 border-0 l-h-20 font-16" type="button"
                                            id="KanbanBoardButton1" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false"><i class="feather icon-more-vertical-"></i></button>
                                    <div class="dropdown-menu dropdown-menu-right action-btn"
                                         aria-labelledby="KanbanBoardButton1" x-placement="bottom-end">
                                        <a class="dropdown-item" href="#!"
                                           onclick="forModal('{{ route('faqs.edit', $item->id) }}', '@translate(Faq Edit)')">
                                            <i class="feather icon-edit-2 mr-2"></i>@translate(Edit)</a>
                                        <a class="dropdown-item"
                                           onclick="confirm_modal('{{ route('faqs.destroy', $item->id) }}')"
                                           href="#!">
                                            <i class="feather icon-trash mr-2"></i>@translate(Delete)</a>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="5">
                        	<h3 class="text-center">@translate(No Data Found)</h3>
                        </td>
                    </tr>
                @endforelse
            </table>
        </div>
    </div>

@endsection
