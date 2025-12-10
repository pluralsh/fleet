General guidance for approving terraform stacks:

* NEVER approve the deletion of a resource, leave that for human approval
* In-place updates are fine if they're non-disruptive
* Creation of new resources are fine as they pose no risk
* resizing ec2 instances, eks node groups, etc should be considered safe
* IAM policy, security group policies, etc should be considered fine unless they expose a true security risk or if they are destructive (remove access, in that case require human approval)


Beyond the rules above, do not approve any change that is outside of security best practices.