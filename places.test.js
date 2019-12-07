const data = require('./places_info.json')

const jsonTest= ()=>{    
    try{
        let json = JSON.parse(data);    
    }catch{
       
    }
    
}

test('Parsing JSON', jsonTest);

