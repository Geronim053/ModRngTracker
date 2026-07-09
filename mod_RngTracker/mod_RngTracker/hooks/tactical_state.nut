::ModRngTracker.modthingy.hook("scripts/states/tactical_state", function(q){

	q.onInit = @(__original) {function onInit(){

		::ModRngTracker.successCountPlayer = 0;
		::ModRngTracker.successCountAi = 0;
		::ModRngTracker.expectedSumPlayer = 0.0;
		::ModRngTracker.expectedSumAi = 0.0;
		::ModRngTracker.numberOfAttacksPlayer = 0;
		::ModRngTracker.numberOfAttacksAi = 0;
		::ModRngTracker.diceRollSumPlayer = 0;
		::ModRngTracker.diceRollSumAi = 0;
		//::ModRngTracker.lastDiceRoll = 0;

		local ret = __original();

		return ret;

	}}.onInit;


	q.onBattleEnded = @(__original) { function onBattleEnded(){

		::logInfo("(mod_RngTracker:) These are the stats of the battle: ");
		::logInfo("Player: " );
		::logInfo("Number of executed attacks: " + ::ModRngTracker.numberOfAttacksPlayer );
		::logInfo("Average hitchance: " + (::ModRngTracker.expectedSumPlayer / ::ModRngTracker.numberOfAttacksPlayer ) );
		::logInfo("Number of expected hits: " + ::ModRngTracker.expectedSumPlayer );
		::logInfo("Number of actual hits: " + ::ModRngTracker.successCountPlayer );
		::logInfo("Average dice-roll: " + ::ModRngTracker.diceRollSumPlayer * 1.0 /::ModRngTracker.numberOfAttacksPlayer );
		
		::logInfo("AI: " );
		::logInfo("Number of executed attacks: " + ::ModRngTracker.numberOfAttacksAi );
		::logInfo("Average hitchance: " + (::ModRngTracker.expectedSumAi / ::ModRngTracker.numberOfAttacksAi ) );
		::logInfo("Number of expected hits: " + ::ModRngTracker.expectedSumAi );
		::logInfo("Number of actual hits: " + ::ModRngTracker.successCountAi );
		::logInfo("Average dice-roll: " + ::ModRngTracker.diceRollSumAi * 1.0 /::ModRngTracker.numberOfAttacksAi );
	
		local ret = __original();

		return ret;
	}}.onBattleEnded;




});