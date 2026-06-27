::ModRngTracker.modthingy.hook("scripts/states/tactical_state", function(q){

	q.onInit = @(__original) function(){

		::ModRngTracker.successCountPlayer = 0;
		::ModRngTracker.successCountAi = 0;
		::ModRngTracker.expectedSumPlayer = 0;
		::ModRngTracker.expectedSumAi = 0;
		::ModRngTracker.numberOfAttacksPlayer = 0;
		::ModRngTracker.numberOfAttacksAi =0;

		__original();

	};


	q.onBattleEnded = @(__original) function(){

		::logInfo("(mod_RngTracker:) These are the stats of the battle: ");
		::logInfo("Player: " );
		::logInfo("Number of executed attacks: " + ::ModRngTracker.numberOfAttacksPlayer );
		::logInfo("Average hintchance: " + (::ModRngTracker.expectedSumPlayer / ::ModRngTracker.numberOfAttacksPlayer ) );
		::logInfo("Number of expected hits: " + ::ModRngTracker.expectedSumPlayer );
		::logInfo("Number of actual hits: " + ::ModRngTracker.successCountPlayer );

		::logInfo("AI: " );
		::logInfo("Number of executed attacks: " + ::ModRngTracker.numberOfAttacksAi );
		::logInfo("Average hintchance: " + (::ModRngTracker.expectedSumAi / ::ModRngTracker.numberOfAttacksAi ) );
		::logInfo("Number of expected hits: " + ::ModRngTracker.expectedSumAi );
		::logInfo("Number of actual hits: " + ::ModRngTracker.successCountAi );
	
		local ret = __original();

		return ret;
	};




});