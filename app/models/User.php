<?php
/**
 * Created by PhpStorm.
 * User: Ivan
 * Date: 18.03.2019
 * Time: 15:59
 */

namespace app\models;


use core\base\Model;

class User extends Model
{
    protected static $table="users";

    protected function getIdName(){
        return "user_id";
    }


    public $user_id;
    public $name;
    public $code;
    public $departs_id;

    public function belongsToDepart(){
        return $this->belongsTo(Depart::class,
            "departs_id",
            "departs_id");
    }
}