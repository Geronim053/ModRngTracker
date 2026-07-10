::ModRngTracker.modthingy.hook("scripts/states/world_state", function(q){
	/*
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
	*/

	q.init = @(__original) {init(){
		//check worldflags for already established flags + establishing them
		//actually, since Flags.set() is basically rawset, we dont need the check; we need it at getting
		//here might still be nicer
		//perhaps I should set to 0... but in theory it should be fine and im lazy now. tod i guess
		if (!::World.Flags.has("successCountPlayer")) {
			::World.Flags.set("successCountPlayer", ::ModRngTracker.successCountPlayer);
			::World.Flags.set("expectedSumPlayer", ::ModRngTracker.expectedSumPlayer);
			::World.Flags.set("numberOfAttacksPlayer", ::ModRngTracker.numberOfAttacksPlayer);
			::World.Flags.set("diceRollSumPlayer", ::ModRngTracker.diceRollSumPlayer);

			::World.Flags.set("successCountAi", ::ModRngTracker.successCountAi);
			::World.Flags.set("expectedSumAi", ::ModRngTracker.expectedSumAi);
			::World.Flags.set("numberOfAttacksAi", ::ModRngTracker.numberOfAttacksAi);
			::World.Flags.set("diceRollSumAi", ::ModRngTracker.diceRollSumAi);

		}

	}}.init;

});