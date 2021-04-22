<div>
    <label class="label-text">@translate(Email Address)<span class="primary-color-2 ml-1">*</span></label>
    <div class="form-group">
        <input class="form-control @error('email') is-invalid @enderror"
        	type="email" name="email" placeholder="Email address" required
        	wire:model="email"
        	value="{{ old('email') }}">
        <small id="emailHelp" class="form-text text-muted">Need for signin to your dashboard, email not appear publicly.</small>
        @error('email')
        <span class="invalid-feedback" role="alert">
          <strong>{!! $message !!}</strong>
        </span>
        @enderror
    </div>
</div>
