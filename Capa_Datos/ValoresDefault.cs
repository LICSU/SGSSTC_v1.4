using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Capa_Datos
{
    public class ValoresDefault
    {
        private ValoresDefault(String[] value) { Value = value; }

        public String[] Value { get; set; }


        static String[] nomCategorias =
            {
            "Reparación de Equipos" ,
            "Mantenimiento de Equipos" ,
            "Capacitación",
            "Actividades Recreativas",
            "Jornada de Exámenes",
            "Entrega de Equipos"
        };
        static String[] desCategorias =
                {
            "Actividad que se realiza en la empresa para la reparación de equipos de protección personal." ,
            "Actividad que se realiza en la empresa para el Mantenimiento de Equipos de proteccion personal." ,
            "Actividad que se realiza en la empresa para la Capacitación de personal.",
            "Actividad que se realiza en la empresa para la gestión de Actividades Recreativas.",
            "Actividad que se realiza en la empresa para las Jornadas de Exámenes.",
            "Actividad que se realiza en la empresa para la Entrega de Equipos de protección personal."
        };
        public static ValoresDefault Nombre_Categorias
        {
            get
            {
                return new ValoresDefault(nomCategorias);
            }
        }
        public static ValoresDefault Descripcion_Categorias
        {
            get
            {
                return new ValoresDefault(desCategorias);
            }
        }

        static String[] nomEstatus =
            {
            "PostEmbarazo"
        };
        static String[] desEstatus =
                {
            "Periodo de Tiempo que se le asigna al trabajador despues del embarazo"
        };
        public static ValoresDefault Nombre_Estatus
        {
            get
            {
                return new ValoresDefault(nomEstatus);
            }
        }
        public static ValoresDefault Descripcion_Estatus
        {
            get
            {
                return new ValoresDefault(desEstatus);
            }
        }

        static String[] nomTipoEpp =
            {
            "Abrigo",
            "Atalaje",
            "Botas",
            "Careta",
            "Casco",
            "Chaleco",
            "Cinturón",
            "Delantal o Peto",
            "Guantes",
            "Lentes",
            "Mangas",
            "Monogafas",
            "Overol",
            "Polainas",
            "Protector Auditivo",
            "Respirador",
            "Arnes",
            "Visor",
            "Traje"
        };
        static String[] desTipoEpp =
                {
            "Uso Obligatorio de Abrigo",
            "Uso Obligatorio de Atalaje",
            "Uso Obligatorio de Botas",
            "Uso Obligatorio de Careta",
            "Uso Obligatorio de Casco",
            "Uso Obligatorio de Chaleco",
            "Uso Obligatorio de Cinturón",
            "Uso Obligatorio de Delantal o Peto",
            "Uso Obligatorio de Guantes",
            "Uso Obligatorio de Lentes",
            "Uso Obligatorio de Mangas",
            "Uso Obligatorio de Monogafas",
            "Uso Obligatorio de Overol",
            "Uso Obligatorio de Polainas",
            "Uso Obligatorio de Protector Auditivo",
            "Uso Obligatorio de Respirador",
            "Uso Obligatorio de Arnes",
            "Uso Obligatorio de Visor",
            "Uso Obligatorio de Traje"
        };
        public static ValoresDefault Nombre_TipoEpp
        {
            get
            {
                return new ValoresDefault(nomTipoEpp);
            }
        }
        public static ValoresDefault Descripcion_TipoEpp
        {
            get
            {
                return new ValoresDefault(desTipoEpp);
            }
        }


        static String[] nomEpp =
                {
            "Abrigo impermeable",
            "Atalaje para casco",
            "Atalaje para visor",
            "Calzado de Seguridad",
            "Botas de Caucho",
            "Botas dieléctricas ",
            "Calzado Dieléctrico tipo Soldador",
            "Calzado Dieléctrico",
            "Careta para Soldar",
            "Casco de Seguridad",
            "Casco de Seguridad Dieléctrico ",
            "Casco de tres punto con barbuquejo ",
            "Casco Dieléctrico",
            "Chaleco reflectivo",
            "Cinturón porta herramientas",
            "Delantal  o Peto de Cuero",
            "Delantal o Peto impermeable",
            "Peto o delantal de carnaza",
            "Peto o delantal Plomado",
            "Peto o delantal de Cuero",
            "Peto impermeable ",
            "Peto de material aluminizado",
            "Guantes de Caucho",
            "Guantes de Neopreno",
            "Guantes de Nitrilo",
            "Guantes de cuero o vaqueta",
            "Guantes de Carnaza",
            "Guantes aislantes de electricidad",
            "Guante impregnado de Vinilo",
            "Guantes de Fibra Sintética",
            "Guantes de malla de acero",
            "Guantes de material aluminizado(contra proyecciones de material incandescente)",
            "Guantes Plomados",
            "Lentes de Seguridad contra impacto con protección UV de policarbonato y protección lateral",
            "Lentes de Seguridad contra impacto de policarbonato y protección lateral",
            "Lentes de Protección para soldadura autógena",
            "Lentes Plomados",
            "Lentes de Seguridad con protección UV",
            "Mangas de material aluminizado",
            "Monogafas de seguridad con ventilación indirecta",
            "Monogafas de seguridad con ventilación directa",
            "Overol impermeable",
            "Polaina de Carnaza",
            "Polaina de tela aluminizada",
            "Protector auditivo tipo tapón (de inserción)",
            "Protector auditivo tipo copa",
            "Respirador con filtro para polvo de alta eficiencia",
            "Respirador con filtros para humos metálicos",
            "Respirador contra gases y vapores (Equipo de línea de aire, respirador con cartucho químico)",
            "Respirador contra humos metálicos",
            "Respirador contra polvo o partículas",
            "Respirador contra Vapores Orgánicos",
            "Respirador contra vapores y gases ácidos",
            "Respirador media cara doble filtro para material particulado",
            "arnés",
            "eslinga con absorbedor de impacto",
            "líneas de vida",
            "eslinga de posicionamiento",
            "anclajes",
            "Sistema de Protección Contra Caídas",
            "Visor de protección facial",
            "Traje impermeable (abrigo y pantalón)",
            "Traje aislante a la llama",
            "Traje Impermeable",
            "Traje aluminizado"
        };
        public static ValoresDefault Nombre_Epp
        {
            get
            {
                return new ValoresDefault(nomEpp);
            }
        }


        static String[] nom_TipoDocumento = {
            "Política y Objetivos del SG-SST",
            "Encuestas para validar que el Personal haya conocido y comprendido la Política del SG-SST",
            "Evaluación Inicial del SG-SST",
            "Descripción del Alcance del SG-SST",
            "Objetivos de Seguridad y Salud en el Trabajo",
            "Descripción de la Estructura  PHVA del SG-SST ",
            "Caracterización de Procesos del SG-SST",
            "Inspecciones de Seguridad",
            "Acciones preventivas, correctivas y de mejoras generadas en las inspecciones de seguridad.",
            "Denuncias , Quejas o Reclamaciones por parte de los Trabajadores",
            "Establecimiento de Indicadores de Medición del SG-SST",
            "Normas y Reglamentos Internos de la Organización",
            "Plan de Trabajo Anual",
            "No conformidades detectadas en el seguimiento al plan de trabajo anual en Seguridad y Salud en el Trabajo",
            "Matriz Legal Actualizada en relación a toda la normatividad legal vigente aplicable en materia de SST",
            "Documentar los Requisitos concretos que hay que cumplir (Generales y Específicos)",
            "Actualización de la Normativa que Sustituye, Reemplaza o Corrige la Existente",
            "Matriz de Peligros, Evaluación y Valoración de los riesgos Actualizada acorde a los peligros y priorización de riesgos de la organización",
            "Resultados de las Evaluaciones de Riesgo ",
            "Medidas de Seguimiento y Control de Riesgos",
            "Reportes de las Condiciones de Trabajo peligrosas realizadas por los trabajadores",
            "Plan de Acción (Recursos y Plazos para alcanzar los objetivos planteados)",
            "Programas de Seguridad y Salud en el Trabajo",
            "Plan de Inducción ",
            "Constancia de Registro de la Inducción ( información de de las condiciones inseguras o insalubres y riesgos a los que estará expuesto el trabajador  y los daños que puede causar a la salud",
            "Plan para la Prevención y Atención de Emergencias en la organización",
            "Mapas de Riesgo Actualizado",
            "Registro de Mapas de Ubicación de Extintores, Lámparas de Emergencia  y Sistemas de Alarma contra Incendio, Planos de Evacuación",
            "Plan de Capacitación en Seguridad y Salud en el Trabajo",
            "Registro de Capacitaciones",
            "Reporte de los incidentes, accidentes de trabajo ",
            "Registro estadístico de  accidentes e incidentes de trabajo",
            "Investigación de Accidentes e Incidentes",
            "Acciones preventivas, correctivas y de mejora, generadas en las investigaciones de los incidentes, accidentes y enfermedades laborales",
            "Actas de reunión mensual  del Comité Paritario de Seguridad y Salud en el Trabajo acorde al tamaño de la organización",
            "Programas de Vigilancia Epidemiológica de acuerdo con el análisis de las condiciones de salud y de trabajo y a los riesgos priorizados",
            "Plan de Equipos de Protección Personal (Selección y Dotación de Epp)",
            "Evidencias del Registro de Entrega de Equipos de Protección Personal",
            "Programación de Selección y Evaluador de Proveedores",
            "Documentar las adquisiciones",
            "Auditoria y Revisión por la Alta Dirección al SG-SST"
        };
        public static ValoresDefault Nombre_TipoDocumento
        {
            get
            {
                return new ValoresDefault(nom_TipoDocumento);
            }
        }
        static String[] dir_TipoDocumento = {
            "Todos los Niveles de la organización",
            "Personal del área Operativa y/o Administrativa",
            "Alta Dirección ,Copasst",
            "Alta Dirección ,Copasst",
            "Alta Dirección,Copasst",
            "Copasst",
            "Copasst",
            "Copasst",
            "Todos los Niveles de la organización",
            "Comunicar a las partes involucradas o interesadas las quejas y opiniones sobre las actividades de la organización",
            "Alta Dirección, Copasst",
            "Todos los Niveles de la organización",
            "Alta Dirección,Copasst",
            "Copasst",
            "Alta Dirección,Copasst",
            "Alta Dirección,Copasst",
            "Copasst",
            "Copasst",
            "Alta Dirección,Copasst",
            "Copasst",
            "Todos los Niveles de la organización",
            "Copasst",
            "Todos los Niveles de la organización",
            "Copasst",
            "Trabajadores de nuevo ingreso",
            "Todos los Niveles de la organización",
            "Todos los Niveles de la organización",
            "Todos los Niveles de la organización",
            "Todos los Niveles de la organización",
            "Todos los Niveles de la organización",
            "Todos los Niveles de la organización",
            "Todos los Niveles de la organización",
            "Todos los Niveles de la organización",
            "Alta Dirección,Copasst",
            "Alta Dirección,Copasst",
            "Alta Dirección,Copasst",
            "Alta Dirección, Copasst",
            "Alta Dirección,Copasst",
            "Proveedores",
            "Alta Dirección ",
            "SG-SST"
        };
        public static ValoresDefault Dirigida_TipoDocumento
        {
            get
            {
                return new ValoresDefault(dir_TipoDocumento);
            }
        }
        static String[] mod_TipoDocumento = {
            "Divulgación interna (mediante entrega de material informativo, Publicaciones en Carteleras, Correo Interno u otros sistemas automatizados)",
            "Aplicación de Encuestas al Personal a través de herramientas digitales o por escrito ",
            "Hacer entrega del Resultado de la Evaluación Inicial, mediante informe escrito firmado por el Responsable de SG-SST",
            "Informe escrito firmado por el Responsable de SG-SST",
            "Informe escrito firmado por el Responsable de SG-SST",
            "Informe escrito firmado por el Responsable de SG-SST",
            "Informe escrito firmado por el Responsable de SG-SST",
            "Registrar las inspecciones realizadas a las instalaciones, máquinas o equipos.",
            "Informe escrito firmado por el Responsable de SG-SST",
            "Documento de Respuesta ante las quejas planteadas por las partes interesadas",
            "Registro de Indicadores",
            "Registrar la entrega de instructivos internos de seguridad y fichas técnicas.",
            "Registro del Cumplimiento del programa de capacitación anual",
            "Registrar las posibles No Conformidades ",
            "Matriz legal actualizada y acorde a la naturaleza de la organización, documentada en físico o digital",
            "Control de Registro del Cumplimiento de cada uno de los Requerimientos en materia legal",
            "Actualizar la matriz legal en la medida que sean emitidas nuevas disposiciones aplicables a la Empresa.",
            "Realizar un panorama de factores de riesgo que permita identificar los peligros y evaluar los riesgos en todos los procesos y actividades rutinarias y no rutinarias",
            "Registro de los Resultados obtenidos",
            "Registro de las  Medidas dispuestas para priorizar los Riesgos  y aplicar los controles necesarios.",
            "Disponer de canales que permitan la recolección de ideas, inquietudes y aportes de los trabajadores en materia de seguridad y salud laboral ( Documento de Reporte, Buzón de Sugerencias)",
            "Registro de las medidas para eliminar o mitigar las no conformidades",
            "Registro del Programa del SG-SST, firmado por el Copasst",
            "Documento de Planificación de los Procesos de Inducción y entrenamiento al Personal, Medios Audio Visuales, Material Informativo, Protocolos de Bienvenida",
            "Documentos firmados por el trabajador, Supervisor inmediato y Operador Maestro encargado de la inducción ",
            "Documentar la identificación de las amenazas y la evaluación de la vulnerabilidad  y los correspondientes planes de prevención y respuesta ante emergencias.",
            "Publicar en cartelera y en lugares visibles el Mapa de Riesgos, así como en la entrada de la Empresa, conservar los mapas en digital",
            "Publicar en cartelera y en lugares visibles en la entrada de la Empresa, Respaldar el mapa en digital",
            "Evidenciar el porcentaje de cumplimiento del plan de capacitación anual  mediante Registros, a través de herramientas digitales y Documentos de Asistencia a los Talleres de Formación Programados",
            "Convocatoria por Escrito o por Correo de las Charlas o Talleres de Formación",
            "Comunicaciones de accidentes o incidentes",
            "Evaluación y análisis de las estadísticas sobre accidentalidad",
            "Documentar las investigaciones de los incidentes, accidentes de trabajo y enfermedades laborales",
            "Registro de las medidas implementadas y el seguimiento posterior ",
            "Registrar los procesos de convocatoria, elección y conformación del comité paritario de seguridad y salud en el trabajo y las actas de las reuniones y los soportes de sus actuaciones.",
            "Realizar un Registro de las condiciones de salud de la Población trabajadora",
            "Inventario de Equipos y Elementos de Protección Personal",
            "Registrar la entrega de Equipos y Elementos de Protección Personal, así como el inventario de los mismos",
            "Vía Telefónica o internet",
            "Establecer y mantener un procedimiento para garantizar y evaluar las especificaciones relativas a la adquisición de productos o servicios, cumpliendo con las disposiciones del SG-SST",
            "Informe de Revisión por la alta Dirección"
        };
        public static ValoresDefault Modalidad_TipoDocumento
        {
            get
            {
                return new ValoresDefault(mod_TipoDocumento);
            }
        }
        static String[] resp_TipoDocumento = {
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Coordinador del SG-SST",
            "Alta Dirección"
        };
        public static ValoresDefault Responsable_TipoDocumento
        {
            get
            {
                return new ValoresDefault(resp_TipoDocumento);
            }
        }
        static String[] apr_TipoDocumento = {
            "Alta Dirección ,Gerencia,Copasst",
            "Copasst",
            "Alta Dirección ,Gerencia,Copasst",
            "Alta Dirección ,Gerencia,Copasst",
            "Copasst",
            "Gerencia,Copasst",
            "Gerencia,Copasst",
            "Gerencia,Copasst",
            "Gerencia,Copasst",
            "Gerencia,Copasst",
            "Alta Dirección ,Gerencia,Copasst",
            "Alta Dirección ,Gerencia,Copasst",
            "Gerencia,Lideres de Proceso,Copasst",
            "Copasst",
            "Alta Dirección,Gerencia,Copasst",
            "Gerencia,Copasst",
            "Gerencia,Copasst",
            "Copasst",
            "Alta Dirección,Copasst",
            "Copasst",
            "Copasst",
            "Copasst",
            "Copasst",
            "Copasst",
            "Lideres de Proceso,Copasst",
            "Lideres de Proceso,Copasst",
            "Lideres de Proceso,Copasst",
            "Lideres de Proceso,Copasst",
            "Lideres de Proceso,Copasst",
            "Copasst",
            "Copasst",
            "Copasst",
            "Copasst",
            "Lideres de Proceso,Copasst",
            "Alta Dirección,Copasst",
            "Alta Dirección,Copasst",
            "Alta Dirección,Copasst",
            "Alta Dirección, Copasst",
            "Alta Dirección,Copasst",
            "Alta Dirección,Gerencia",
            "Alta Dirección,Copasst"
        };
        public static ValoresDefault Aprobado_TipoDocumento
        {
            get
            {
                return new ValoresDefault(apr_TipoDocumento);
            }
        }
        static String[] arc_TipoDocumento = {
            "Material Físico almacenado en archivadores o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital",
            "Registro de Documentos, almacenados en físico o en Soporte Digital",
            "Registro de Documentos previamente Firmados, almacenados en físico o en Soporte Digital"
        };
        public static ValoresDefault Archivado_TipoDocumento
        {
            get
            {
                return new ValoresDefault(arc_TipoDocumento);
            }
        }
    }
}
