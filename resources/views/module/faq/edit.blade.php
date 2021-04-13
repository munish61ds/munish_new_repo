<div class="card-body">
    <form action="{{route('faqs.update')}}" method="post" enctype="multipart/form-data">
        @csrf
        <input type="hidden" name="id" value="{{$faq->id}}">
        <div class="form-group">
            <label>@translate(Question) <span class="text-danger">*</span></label>
            <input class="form-control" value="{{$faq->question}}" type="text" name="question" required>
        </div>
        <div class="form-group">
            <label>@translate(Answer) <span class="text-danger">*</span></label>
            <textarea rows="5" class="form-control" name="answer" required>{{$faq->answer}}</textarea>
        </div>
        <div class="form-group">
            <label>@translate(Category type) <span class="text-danger">*</span></label>
            <select class="form-control" name="type" required>
            	<option value="general" {{ ($faq->type == 'general') ? 'selected' : '' }}>General</option>
            	<option value="spoken_english" {{ ($faq->type == 'spoken_english') ? 'selected' : '' }}>Spoken English</option>
            	<option value="ielts_pte_toefl" {{ ($faq->type == 'ielts_pte_toefl') ? 'selected' : '' }}>IELTS/ PTE/ TOEFL</option>
            </select>
        </div>
        <div class="float-right">
            <button class="btn btn-primary float-right" type="submit">@translate(Save)</button>
        </div>
    </form>
</div>

