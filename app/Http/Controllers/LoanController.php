<?php

namespace App\Http\Controllers;
use App\userLoanRequest\loan;
use App\userLoanRequest\Emi;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class LoanController extends Controller
{   /**
    * @return \Illuminate\Http\Response
    */
    public function index(Request $request){
        $response = [
            'loans' =>  auth()->user()->loan()->get(),
            'message' =>  'success'
        ];
        return response($response, 200);
    }
    /**
     *  There is check for loan, One user can request a loan at a time.
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'type' => 'required|string',
            'amount' => 'required|regex:/^\d+(\.\d{1,2})?$/',
            'period' => 'required|integer|between:1,12',
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
       
        $request['user_id'] = auth()->user()->id;
        
        if(loan::where(["user_id" => auth()->user()->id])->where('status', '!=' , 2)->count() == 0){

            loan::create($request->toArray());
            $response = [
                'message' => 'loan created'
            ];

        }else{
            $response = [
                'message' => 'you can\'t create Loan, The previous loan is already there'
            ];
        }
        return response($response, 200);
    }
    /**
    * @return \Illuminate\Http\Response
    */
    public function detail(Request $request){
        $validator = Validator::make($request->all(), [
            'loan_id' => 'required|integer',
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
       
        $emis = auth()->user()->loan()->where(["id"=>$request['loan_id']])->first()->emi()->get();

        $response = [
            'emis' =>  $emis,
            'message' =>  'success'
        ];
        return response($response, 200);
    }

    /**
    * @return \Illuminate\Http\Response
    */
    public function repayment(Request $request){
        $validator = Validator::make($request->all(), [
            'emi_id' => 'required|integer',
            'date' => 'required|date_format:Y-m-d',
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
        $emi = Emi::where([
            "id" => $request["emi_id"],
            "date" => $request["date"]
        ])->first();

        if($emi && $emi->status == 0){
            $emi->update(["status" => 1 ]);
            $response = [
                'message' =>  "{$emi->amount} successfully paid",
            ];
        }else{
            $response = [
                'message' =>  "emi not found",
            ];
        }
        return response($response, 200);
    }

}
