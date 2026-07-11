::ModRngTracker.findAttackEntity <- function (){
	local i = 1; 
	local stackinfos = getstackinfos(i);
	local boolSkillWasInvolved = false;
	
	do 
	{
		
		if (::MSU.isKindOf(stackinfos.locals["this"], "skill"))
		{
			boolSkillWasInvolved = true;
			if ("r" in stackinfos.locals)
			{
				
				break;
			}
		}
		i++;
		stackinfos = getstackinfos(i);
	} 
	while (stackinfos != null);		
	if ((stackinfos == null) && boolSkillWasInvolved) ::logWarning("(RngTracker:) something might have gone wrong; no function of 'skill' with r found.");
	

	return stackinfos;


};