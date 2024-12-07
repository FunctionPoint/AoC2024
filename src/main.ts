// Invoke the start method on a new AocApp ST object.

let moduleName: string = "./AocApp.js";
import( moduleName )
	.then( module => { module.stAocApp$class.$new().$start() } );
