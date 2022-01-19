<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\userLoanRequest\loan;
use App\userLoanRequest\Emi;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AdminController extends Controller
{
    /**
     * 
     * 
     * @return \Illuminate\Http\Response
     */
    public function AproveLoanRequest(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'loan_id' => 'required|integer',
            'user_id' => 'required|integer',
            'interest_rate' => 'required|integer',
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }

        $loan = loan::where([
            "id" => $request['loan_id'],
            "user_id" => $request['user_id'],
            "is_approved" => 0
        ]);

        if($loan->count() > 0){
            $loan = $loan->first();

            $loan->update([
                "is_approved" => 1,
                "status" => 1,
                "interest_rate" => $request['interest_rate']
            ]);
            $loan_amount = $loan->amount;
            $interest_rate = $request['interest_rate'];
            $duration = $loan->period;

            $loan_amount = calculateEmiAmount($loan_amount, $interest_rate, $duration);

            $start_date = date('Y-m-d');

            for($i=0; $i<$duration; $i++){
                Emi::create([
                    'loan_id' => $request['loan_id'],
                    'user_id' => $request['user_id'],
                    'amount' => $loan_amount,
                    'date'  => $start_date
                ]);
                $date = strtotime($start_date);
                $date = strtotime("+7 day", $date);
                $start_date = date('Y-m-d', $date);
            }
            $response = [
                'message' => 'loan request is approved',
                'weekly_repayment_amount' => $loan_amount 
            ];
        }else{
            $response = [
                'message' => 'loan request not found'
            ];
        }
        return response($response, 200);
        
    }
}
