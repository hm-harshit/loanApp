<?php

    /**
	* [Calculate EMI Amount]
	* @param  [int] $base_amount     [Base loan amount]
	* @param  [float] $interest_rate   [Rate of interest]
	* @param  [int] $duration        [Duration in Month]
	* @return [floar]                  [Emi Amount]
	*/
	function calculateEmiAmount($base_amount, $interest_rate, $duration){
		$total_interest_rate =  $interest_rate;
		$interest_amount = ($total_interest_rate / 100) * $base_amount; //Interest per year
		$total_interest = $interest_amount * ( $duration / 12 ); //Total Profitfor given duration
		$total_amount_payable = $base_amount + $total_interest; //Total Amount
		$emi_amount = $total_amount_payable / $duration; //EMI per month
		return $emi_amount;
	}

?>