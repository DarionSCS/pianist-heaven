<?php

namespace App\View\Components;

use Illuminate\View\Component;

class Timer extends Component
{
    public $action;
    public $song;

    public function __construct($action, $song)
    {
        $this->action = $action;
        $this->song = $song;
    }

    public function render()
    {
        return view('components.timer');
    }
}
