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
		::ModRngTracker.lastDiceRoll = 0;

		local ret = __original();

		return ret;

	}}.onInit;


	q.onBattleEnded = @(__original) { function onBattleEnded(){
		//prints
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
		
		//saves to worldflags 
		//we need to check whether the Flags do exist, so the get() doesnt error.
		if (::World.Flags.has("successCountPlayer")){
			::World.Flags.set("successCountPlayer", ::World.Flags.get("successCountPlayer") + ::ModRngTracker.successCountPlayer);
			::World.Flags.set("expectedSumPlayer", ::World.Flags.get("expectedSumPlayer") + ::ModRngTracker.expectedSumPlayer);
			::World.Flags.set("numberOfAttacksPlayer", ::World.Flags.get("numberOfAttacksPlayer") + ::ModRngTracker.numberOfAttacksPlayer);
			::World.Flags.set("diceRollSumPlayer", ::World.Flags.get("diceRollSumPlayer") + ::ModRngTracker.diceRollSumPlayer);

			::World.Flags.set("successCountAi", ::World.Flags.get("successCountAi") + ::ModRngTracker.successCountAi);
			::World.Flags.set("expectedSumAi", ::World.Flags.get("expectedSumAi") + ::ModRngTracker.expectedSumAi);
			::World.Flags.set("numberOfAttacksAi", ::World.Flags.get("numberOfAttacksAi") + ::ModRngTracker.numberOfAttacksAi);
			::World.Flags.set("diceRollSumAi", ::World.Flags.get("diceRollSumAi") + ::ModRngTracker.diceRollSumAi);


		} else {	//if we hooked worldstate, I could at least eliminate this fucking portion
			::World.Flags.set("successCountPlayer", ::ModRngTracker.successCountPlayer);
			::World.Flags.set("expectedSumPlayer", ::ModRngTracker.expectedSumPlayer);
			::World.Flags.set("numberOfAttacksPlayer", ::ModRngTracker.numberOfAttacksPlayer);
			::World.Flags.set("diceRollSumPlayer", ::ModRngTracker.diceRollSumPlayer);

			::World.Flags.set("successCountAi", ::ModRngTracker.successCountAi);
			::World.Flags.set("expectedSumAi", ::ModRngTracker.expectedSumAi);
			::World.Flags.set("numberOfAttacksAi", ::ModRngTracker.numberOfAttacksAi);
			::World.Flags.set("diceRollSumAi", ::ModRngTracker.diceRollSumAi);

		}
		//prints
		::logInfo("(mod_RngTracker:) These are the stats of the campaign: ");
		::logInfo("Player: " );
		::logInfo("Number of executed attacks: " + ::World.Flags.get("numberOfAttacksPlayer") );
		::logInfo("Average hitchance: " + (::World.Flags.get("expectedSumPlayer") / ::World.Flags.get("numberOfAttacksPlayer") ) );
		::logInfo("Number of expected hits: " + ::World.Flags.get("expectedSumPlayer") );
		::logInfo("Number of actual hits: " + ::World.Flags.get("successCountPlayer"));
		::logInfo("Average dice-roll: " + ::World.Flags.get("diceRollSumPlayer") * 1.0 /::World.Flags.get("numberOfAttacksPlayer") );
		
		::logInfo("AI: " );
		::logInfo("Number of executed attacks: " + ::World.Flags.get("numberOfAttacksAi") );
		::logInfo("Average hitchance: " + (::World.Flags.get("expectedSumAi") / ::World.Flags.get("numberOfAttacksAi") ) );
		::logInfo("Number of expected hits: " + ::World.Flags.get("expectedSumAi") );
		::logInfo("Number of actual hits: " + ::World.Flags.get("successCountAi") );
		::logInfo("Average dice-roll: " + ::World.Flags.get("diceRollSumAi") * 1.0 /::World.Flags.get("numberOfAttacksAi") );
		
		//I hate how bloated all of this shit looks


		local ret = __original();

		return ret;
	}}.onBattleEnded;




});