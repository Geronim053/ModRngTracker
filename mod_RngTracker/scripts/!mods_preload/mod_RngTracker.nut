::ModRngTracker <- {
	ID = "mod_RngTracker",
	Name = "ModRngTracker",
	Version = "1.0.0"
}
::ModRngTracker.modthingy <- ::Hooks.register(::ModRngTracker.ID, ::ModRngTracker.Version, ::ModRngTracker.Name);
 
::ModRngTracker.successcountplayer <- 0;
::ModRngTracker.successcountai <- 0;
::ModRngTracker.expectedsumplayer <- 0;
::ModRngTracker.expectedsumai <- 0;
::ModRngTracker.numberofattacksplayer <- 0;
::ModRngTracker.numberofattacksai <- 0;






::ModRngTracker.modthingy.require("mod_msu");

::ModRngTracker.modthingy.queue(">mod_msu", function(){

	::ModRngTracker.Mod <- ::MSU.Class.Mod(::ModRngTracker.ID, ::ModRngTracker.Version, ::ModRngTracker.Name);
	
	
	::include("mod_RngTracker/hooks/skill");
	::include("mod_RngTracker/hooks/tactical_state")

	

}, ::Hooks.QueueBucket.Late);
