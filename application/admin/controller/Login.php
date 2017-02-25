<?php

namespace app\admin\controller;
use think\Db;
use think\Controller;
use think\Request;

class Login extends Controller
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function login()
    {
        //判断session
        if(session("userinfo")["u_id"]>0){
            $this->success("登陆成功,进入系统...","admin/index/index");
        }else{
            return $this->fetch("Login/login");
        }
    }

    //登陆
    public function loginon(){
        $data=array();
        $data['username']=input('post.username');
        $data['pwd']=input('post.password');
        if(empty($data)){
            return $this->error("用户名或密码不能为空","admin/login/login");
        }
        $member=Db::name("member")->where('m_username',$data['username'])->find();
        if(!$member){
            return $this->error("用户不存在！",'admin/login/login');
        }else{
            if($data['pwd']!==$member['m_psw']){
                return $this->error("密码错误!",'admin/login/login');
            }else{
                foreach ($member as $key => $value) {
                  session(strtolower($key),strtolower($value));
                }
                unset($member);
                return  $this->success("登陆成功",'admin/index/index');
            }
        }
    }
    //退出登录
    public function loginout(){
          session('user_info',null);
          session(null);
          return $this->success("退出成功",'admin/login/login');
    }

}
