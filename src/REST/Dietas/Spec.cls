Class REST.Dietas.Spec Extends %RegisteredObject [ ProcedureBlock ]
{

XData OpenAPI [ MimeType = application/json ]
{
{
  "openapi":"3.0.1",
  "info":{
    "title":"Dietas y Menus de Pacientes ingresados",
    "description":"Dietas de Pacientes",
    "contact":{
      "email":"Pierre-Yves.Duquesnoy@intersystems.com"
    },
    "license":{
      "name":"Apache 2.0",
      "url":"http://www.apache.org/licenses/LICENSE-2.0.html"
    },
    "version":"1.0.0"
  },
  "servers":[
    {
      "url":"/"
    }
  ],
  "paths":{
    "/dietas/{IDPaciente}":{
      "get":{
        "summary":"Obtiene Dieta de Paciente",
        "description":"Obtiene la Dieta de un paciente ingresado",
        "operationId":"leerDieta",
        "parameters":[
          {
            "name":"IDPaciente",
            "in":"path",
            "description":"El Identificador de paciente",
            "required":true,
            "style":"simple",
            "explode":false,
            "schema":{
              "type":"string"
            }
          }
        ],
        "responses":{
          "200":{
            "description":"la dieta",
            "content":{
              "application/json":{
                "schema":{
                  "type":"object"
                }
              }
            }
          },
          "400":{
            "description":"bad input parameter",
            "content":{
            }
          }
        }
      }
    }
  },
  "components":{
    "schemas":{
      "RMCocinaRecord":{
        "required":[
          "Dieta",
          "Habitacion",
          "IDPaciente",
          "NombreCompleto"
        ],
        "type":"object",
        "properties":{
          "IDPaciente":{
            "type":"integer",
            "example":1009
          },
          "NombreCompleto":{
            "type":"string",
            "example":"Ana Victoria GarcÃ­a ObregÃ³n"
          },
          "Habitacion":{
            "type":"string",
            "example":"1204"
          },
          "FechaEntrada":{
            "type":"string",
            "example":"2023-04-21"
          },
          "Dieta":{
            "type":"string",
            "example":"Dieta basal sin lactosa"
          },
          "Acompanante":{
            "type":"boolean",
            "example":true
          },
          "DietaAcompanante":{
            "type":"string",
            "example":"Dieta basal"
          }
        }
      }
    }
  }
}
}

}
