<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Http\Response;
use Tests\TestCase;

class loanControllerTest extends TestCase
{
    /**
     *
     * @return void
     */
    public function testUserRegistrationLaravelPassport() {
        
        $userData = [
            "name" => "John Doe",
            "email" => "doe@example.com",
            "password" => "demo12345"
        ];

        $this->json('POST', 'api/register', $userData, ['Accept' => 'application/json'])
            ->assertStatus(500)
            ->assertJson([
                "message" => "Personal access client not found. Please create one."
            ]);
      }

      public function testLoginIfUserExist() {
    
        $userData = [
            "email" => "doe@example.com",
            "password" => "demo12345"
        ];

        $this->json('POST', 'api/login', $userData, ['Accept' => 'application/json'])
            ->assertStatus(422)
            ->assertJson([
                "message" => "User does not exist"
            ]);
      }

      public function testCheckIfUserIsAuthrosied() {

        $this->json('get', 'api/user')
            ->assertStatus(401)
            ->assertJson([
                'message' => 'Unauthenticated.'
            ]);
      }

      public function test_Check_If_Unauthorized_User_Can_Request_loan_Create() {

        $userData = [
            "type":personal loan
            "amount":100
            "period":12
        ];

        $this->json('POST', '/loan/create', $userData, ['Accept' => 'application/json'])
            ->assertStatus(404);
      }

      public function test_Check_If_Unauthorized_User_Can_access_loan() {
    
        $this->json('get', '/loans', ['Accept' => 'application/json'])
            ->assertStatus(404);
      
    }
    public function test_Check_If_Normal_User_Can_Approve_loan_request() {
    
        $userData = [
            "loan_id":2
            "user_id":2
            "interest_rate":2
        ];

        
       $this->json('POST', '/admin/loan/approve', $userData, ['Accept' => 'application/json'])
            ->assertStatus(404)
            ->assertJson([
                'message' => ''
            ]);
    }
}
