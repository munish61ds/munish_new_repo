<form action="{{route('evaluation-test.update')}}" method="post"  enctype="multipart/form-data">
    <input name="id" type="hidden" value="{{$test->id}}">
    <input name="status" type="hidden" value="{{$test->status}}">
    @csrf
    <div class="row">
        <div class="form-group col-md-6 p-3">
            <label class="" for="val-title">
                @translate(Test Name) <span class="text-danger">*</span></label>
            <div class="">
                <input type="text" required
                       value="{{ $test->name }}"
                       class="form-control"
                       name="name" placeholder="@translate(Enter Test Name)" aria-required="true" autofocus>
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <label class="" for="val-title">
                @translate(Test Time)(Minutes) Ex:10</label>
            <div class="">
                <input type="number"
                       value="{{$test->test_time}}"
                       class="form-control"
                       name="test_time" placeholder="@translate(Default infinity)" aria-required="true"
                       autofocus>
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <label class="" for="val-title">
                @translate(Pass Mark)</label>
            <div class="">
                <input type="number" step="0.01" required
                       value="{{$test->pass_mark}}"
                       class="form-control"
                       name="pass_mark" placeholder="@translate(Pass Mark)" aria-required="true" autofocus>
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <label class="" for="val-provider">@translate(Select Category) </label>
            <div class="col-lg-9">
                <select class="form-control" name="category_id" required>
                    <option value="">@translate(Select Category)</option>
                    @foreach($categories as $category)
                        <option value="{{$category->id}}" {{$test->category_id == $category->id ? 'selected' : null}}>{{$category->name}}</option>
                    @endforeach
                </select>
            </div>
        </div>


    </div>
    <button class="btn btn-outline-success" type="submit"> @translate(Update)</button>
</form>
