<?php

namespace app\admin\controller;
use think\Db;
use think\Controller;
use think\Request;

class Base extends Controller
{

    public function _initialize()
    {
          if(!session("m_id")>0){
              $this->error("登陆超时","admin/login/login");
          }
    }

}
