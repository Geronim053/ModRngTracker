::ModRngTrackerMV.modthingy.hook("scripts/states/tactical_state", function(q){

	q.onInit = @(__original) {function onInit(){

		::ModRngTrackerMV.successCountPlayer = 0;
		::ModRngTrackerMV.successCountAi = 0;
		::ModRngTrackerMV.expectedSumPlayer = 0.0;
		::ModRngTrackerMV.expectedSumAi = 0.0;
		::ModRngTrackerMV.numberOfAttacksPlayer = 0;
		::ModRngTrackerMV.numberOfAttacksAi =0;
		::ModRngTrackerMV.diceRollSumPlayer = 0;
		::ModRngTrackerMV.diceRollSumAi = 0;
		

		local ret = __original();

		return ret;

	}}.onInit;


	q.onBattleEnded = @(__original) { function onBattleEnded(){

		::logInfo("(mod_RngTracker:) These are the stats of the battle: ");
		::logInfo("Player: " );
		::logInfo("Number of executed attacks: " + ::ModRngTrackerMV.numberOfAttacksPlayer );
		::logInfo("Average hitchance: " + (::ModRngTrackerMV.expectedSumPlayer / ::ModRngTrackerMV.numberOfAttacksPlayer ) );
		::logInfo("Number of expected hits: " + ::ModRngTrackerMV.expectedSumPlayer );
		::logInfo("Number of actual hits: " + ::ModRngTrackerMV.successCountPlayer );
		::logInfo("Average dice-roll: " + ::ModRngTrackerMV.diceRollSumPlayer * 1.0 /::ModRngTrackerMV.numberOfAttacksPlayer );
		
		::logInfo("AI: " );
		::logInfo("Number of executed attacks: " + ::ModRngTrackerMV.numberOfAttacksAi );
		::logInfo("Average hitchance: " + (::ModRngTrackerMV.expectedSumAi / ::ModRngTrackerMV.numberOfAttacksAi ) );
		::logInfo("Number of expected hits: " + ::ModRngTrackerMV.expectedSumAi );
		::logInfo("Number of actual hits: " + ::ModRngTrackerMV.successCountAi );
		::logInfo("Average dice-roll: " + ::ModRngTrackerMV.diceRollSumAi * 1.0 /::ModRngTrackerMV.numberOfAttacksAi );
	
		local ret = __original();

		return ret;
	}}.onBattleEnded;




});