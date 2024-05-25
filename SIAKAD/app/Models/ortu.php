<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ortu extends Model
{
    use HasFactory;
    protected $fillable = ['nama-ortu','penghasilan','tanggungan'];
    public $timestamps = false;
}
