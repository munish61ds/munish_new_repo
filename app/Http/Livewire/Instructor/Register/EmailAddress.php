<?php

namespace App\Http\Livewire\Instructor\Register;

use Livewire\Component;

class EmailAddress extends Component
{
	public $email = '';

	public function updated() {
		$this->validate([
			'email' => 'unique:users,email'
		], [
			'email.unique' => 'Email is already exist, <a href="'.route('login').'">Log in</a>'
		]);
	}

    public function render()
    {
        return view('livewire.instructor.register.email-address');
    }
}
