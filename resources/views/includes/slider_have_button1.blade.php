@php
	$display_status = false;
	$checked_status = '';
	$content = '';
	$link = '';
	if($type == 'edit') {
		$attrs = json_decode($slider->attributes);
		$display_status = $attrs->have_button->status;
		if($display_status) {
			$checked_status = 'checked';
		}
		$content = $attrs->have_button->content;
		$link = $attrs->have_button->link;
	}
@endphp

<div class="form-group">
    <div class="switchery-list">
        <input type="checkbox" name="attr_have_button" class="js-switch-success" id="val-have_button"
        	{{ $checked_status }} />
        <label class="col-form-label" for="val-have_button">
            @translate(Have a button?)</label>
    </div>
    @error('have_button') <span class="invalid-feedback" role="alert"> <strong>{{ $message }}</strong> </span> @enderror
</div>
<div class="row" style="@if(!$display_status) display: none; @endif" id="have_button_container">
	<div class="col-md-6">
        <div class="form-group">
            <label>@translate(Button content) </label>
            <input class="form-control" placeholder="@translate(Button content)"
            	name="attr_button_content" type="text"
            	value="{{ $content }}">
        </div>
	</div>
	<div class="col-md-6">
        <div class="form-group">
            <label>@translate(Button link) </label>
            <input class="form-control" placeholder="@translate(Button link)"
            	name="attr_button_link" type="text"
            	value="{{ $link }}">
        </div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		$('#val-have_button').on('change', function(){
			if($(this).prop('checked')) {
				$('#have_button_container').slideDown(100);
			} else {
				$('#have_button_container').slideUp(100);
			}
		})
	})
</script>