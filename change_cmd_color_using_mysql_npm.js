//var mysql      = require('mysql');
import mysql from 'mysql';
//const {mysql} = mysql;
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'xxx',
  password : 'xxx',
  database : 'girl_front_line'
});

const redcolor ="\x1b[31m";
const yellowcolor ="\x1b[33m";
const reset = "\x1b[0m";

connection.connect();
 let querstring ="Select * from detail where gunname like '%CR-21%'"; 
 //let querstring ="Select * from detail where id like '%風暴%'"; 
 // let querstring ="Select * from findcase where br_fullname like '%110%'";
connection.query(querstring, function (error, results, fields) {
	if(results.length ==1 ){
		console.log(`${results[0].id},${results[0].gunname},${yellowcolor}入庫=${results[0].inventory}${reset},${results[0].type_of_gun}`); 
	}
	  else if (results.length >0 ){
		console.log(results); 
	}
	 else if (results.length ==0 ){
		console.log(`${redcolor}record not fond~!${reset}`); 
	} 
	 else if (error) {
		console.log(error)
	}
	//if (error) throw error
  //console.log(`${results[0]}`); 
 // console.log(results);
 //console.log(Object.keys(results[0]));
 
 
});
connection.end();