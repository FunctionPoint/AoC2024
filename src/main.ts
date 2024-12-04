// Invoke the start method on a new AocAppApp ST object.

let moduleName: string = "./AocApp.js";
import( moduleName )
	.then( module => { module.stAocApp$class.$new().$start() } );
