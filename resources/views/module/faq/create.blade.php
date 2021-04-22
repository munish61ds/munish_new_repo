<div class="card-body">
    <form action="{{route('faqs.store')}}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label>@translate(Question) <span class="text-danger">*</span></label>
            <input class="form-control" placeholder="@translate(Enter Question)" type="text" name="question" required>
        </div>
        <div class="form-group">
            <label>@translate(Answer) <span class="text-danger">*</span></label>
            <textarea rows="5" class="form-control" placeholder="@translate(Enter Sub Title)" name="answer" required></textarea>
        </div>
        <div class="form-group">
            <label>@translate(Category type) <span class="text-danger">*</span></label>
            <select class="form-control" name="type" placeholder="@translate(Category type)" required>
            	<option value="general">General</option>
            	<option value="spoken_english">Spoken English</option>
            	<option value="ielts_pte_toefl">IELTS/ PTE/ TOEFL</option>
            </select>
        </div>
        <div class="float-right">
            <button class="btn btn-primary float-right" type="submit">@translate(Save)</button>
        </div>
    </form>
</div>