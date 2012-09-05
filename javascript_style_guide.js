// Use 2 spaces for indentations

// Do not use /* */ style block quotes

// Use camelcase for variable and function names
  // good:
    var myVar;
    function myFunction() {
      return true;
    }
  // bad:
    var my_var;
    function my_function() {
      return true;
    }

// Declare all variable names at top of function definition on separate lines.
  // good:
    var myVar = true,
        yourVar = false;
    var myVar = true;
    var yourVar = false;
  // bad:
    var myVar = true, yourVar = false;

// Do not use chained variable declarations
  // good:
    var myVar = true,
        yourVar = true;
  // bad:
    var myVar = yourVar = true;

// End all functional lines with ;
  // good:
    myFunction(arg);
    var myObj = {};
  // bad:
    myFunction(arg)
    var myObj = {};

// Indent block content by two spaces
  // good:
    $(function() {
      if (true) {
        myFunction();
      }
    });
  // bad:
    $(function() {
    if (false) {
        myFunction();
    }
    })

// No spaces after ( and before ) in function calls.
  // good:
     myFunction(arg);
  // bad:
     myFunction( arg );

// Use 1 space between if and (.
  // good:
   if (true) {
     return true;
   }
  // bad:
   if(false) {
   return false;
 }

// Use 1 space between ) and { and on the same line.
  // good:
    if (true) {
      return true;
    }
    var myFunction = function() {
      return true;
    };
  // bad:
    if (false){
      return false;
    }
    if (false)
    {
      return false;
    }
    var myFunction = function(){
      return true;
    };
    var myFunction = function()
    {
      return true;
    };

// No spaces after [ and before ];
  // good:
    a = [1,2,3];
    obj[key]
  // bad:
    a = [ 1,2, 3];
    a = [1, 2,3];
    a = [1,2 ,3];
    obj[ key ]

// Use {}'s for all if statements
  // good:
    if (true) {
      return true;
    }
  // bad:
    if (false)
      return false;

// Use a new line after { and before } in if conditions and function definitions
  // good:
    if (true) {
      return true;
    }
    $('#myDiv').click(function() {
      return true;
    });
  // bad:
    if (true) { return true; }
    $('#myDiv').click(function() { return true; });

// Put else if's on the same line as the previous block's closing }
  // good:
    if (true) {
      return true;
    } else if (false) {
      return false;
    }
  // bad:
    if (true) {
      return true;
    }
    else if (false) {
      return false;
    }

// Define single line objects with no spaces after { and before }
  // good:
    var obj = {key: 'value'};
  // bad:
    var obj = { key: 'value' };

// Define multi-line objects with new lines after { and before }
  // good:
    var obj = {
      key: 'value',
      otherKey: 'otherValue'
    };
  // bad:
    var obj = {key: 'value',
      otherKey: 'otherValue'};

// Define objects on same line as return keyword
  // good:
    return {
      key: 'value'
    };
    return {key: 'value'};
  // bad:
    return
    {
      key: 'value'
    };

// Avoid switch statements

// Avoid the for(... in ...) loop

// Don't use $ prefix for variables that are jQuery objects
  // good:
    var self = $(this);
  // bad:
    var $self = $(this);
