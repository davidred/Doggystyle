getKeyByValue = function( object, value ) {
  for( var prop in object ) {
    if( object[prop] === value ) {
      return prop;
    }
  }
};
