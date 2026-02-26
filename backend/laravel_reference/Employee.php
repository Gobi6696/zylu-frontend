<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Employee extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'join_date',
        'is_active',
    ];

    /**
     * The attributes that should be cast.
     */
    protected $casts = [
        'is_active' => 'boolean',
        'join_date' => 'date',
    ];

    /**
     * Accessor to check if employee should be flagged.
     * Flag: > 5 years and active.
     */
    public function getShouldBeFlaggedAttribute(): bool
    {
        $years = Carbon::parse($this->join_date)->diffInYears(now());
        return $years >= 5 && $this->is_active;
    }
}
