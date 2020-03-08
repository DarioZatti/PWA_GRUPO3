/* app.js file
   SE ACTIVA CON NODE APP.JS/

/* DEPENDENCIAS Y FRAMEWORK */
var path = require('path');
var logger = require('morgan');
var express = require('express'); 
var bodyParser = require('body-parser');
var neo4j = require('neo4j-driver');


var app = express();

/* CREO SERVER */
app.listen(3000);
console.log('Server started ok on port 3000');

/* PARSER */
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

/* DEFINO DRIVER PARA Neo4j */
var driver = neo4j.driver('bolt://localhost:7687', neo4j.auth.basic('neo4j','1234') );
var session = driver.session();

/* 
   ESTA PARTE SEGUN DISEÑO PUEDE SEPARARSE EN ROUTERS Y HANDLERS 
   SE DEBE PARSEAR LOS DATOS PARA GENERAR EL CREATE O MATCH ESPECIFICO
   A FINES DE EXPOSICION DE TP SE TRABAJA CON 1 AULA, 1 MATERIA y 1 RELACION
   SE GENERAN LOS REQs DESDE POSTMAN
*/

/* GET AULAS */

app.get('/aula', function(req, res)	{
	 session
        .run("MATCH (n:Aula) RETURN n LIMIT 5")		    
            .then(function (result) {
                console.log(result); 
				res.send({"retorno":result});				
       })
            .catch(function (error) {
              console.log(error);
   });

});

/* GET MATERIAS */

app.get('/materia', function(req, res)	{
	 session
        .run("MATCH (n:Materia) RETURN n LIMIT 5")		    
            .then(function (result) {
                console.log(result); 
				res.send({"retorno":result});				
       })
            .catch(function (error) {
              console.log(error);
   });

});
/* CREATE AULA */

app.post("/aula",(req,res) => {
	session
    .run("CREATE (a1:Aula {Nombre:'Aula1', Capacidad:35})")
 	      .then(function (result) {
            console.log("PROBANDO POST");
			console.log("req.body ",req.body);
			res.send({"retorno":"AULA CREADA"});
       })
       .catch(function (error) {
                console.log(error);
       });
});

/* CREATE MATERIA */

app.post("/materia",(req,res) => {
	session
    .run("CREATE (m1:Materia{Nombre:'Materia1', CantidadDeAlumnos:15})")
 	      .then(function (result) {
            console.log("PROBANDO POST");
			console.log("req.body ",req.body);
			res.send({"retorno":"MATERIA CREADA"});
       })
       .catch(function (error) {
                console.log(error);
       });
});

/* CREATE RELACION MATERIA - AULA */

app.post("/relacion",(req,res) => {
	session
    .run("MATCH (a1:Aula) MATCH (m1:Materia) CREATE (m1)-[:sedicta]->(a1)")     
 	      .then(function (result) {
            console.log("PROBANDO CREATE RELACION");
			console.log("req.body ",req.body);
			res.send({"retorno":"RELACION CREADA"});
       })
       .catch(function (error) {
                console.log(error);
       });
});

module.exports = app;
