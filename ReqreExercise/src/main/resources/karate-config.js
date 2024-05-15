function fn(){

var env=karate.env
var properties = read('classpath:karate-properties.json')

if(!env){
env = 'qa';
}

var config= properties[env];
return config;
}