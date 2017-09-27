namespace Capa_Datos
{
    public class Paginas
    {
        private Paginas(string value) { Value = value; }

        public string Value { get; set; }

        public static Paginas MenuPrincipal { get { return new Paginas("../MenuPrincipal/index.aspx"); } }
        public static Paginas Enviando { get { return new Paginas("Enviando.aspx"); } }

        public static Paginas index_AsignacionResponsable { get { return new Paginas("index_AsignacionResponsable.aspx"); } }
        public static Paginas index_ActaCopasst { get { return new Paginas("index_ActaCopasst.aspx"); } }
        public static Paginas index_AutoEvaluacion { get { return new Paginas("index_AutoEvaluacion.aspx"); } }
        public static Paginas index_AccidenteLaboral { get { return new Paginas("index_AccidenteLaboral.aspx"); } }
        public static Paginas index_BrigadaEmergencias { get { return new Paginas("index_BrigadaEmergencias.aspx"); } }
        public static Paginas index_Empresa { get { return new Paginas("index_Empresa.aspx"); } }
        public static Paginas index_Encuesta_PoliticaSST { get { return new Paginas("index_Encuesta_PoliticaSST.aspx"); } }
        public static Paginas index_EvaluacionesPuestos { get { return new Paginas("index_EvaluacionesPuestos.aspx"); } }
        public static Paginas index_EvaluacionRiesgo { get { return new Paginas("index_EvaluacionRiesgo.aspx"); } }
        public static Paginas index_DescGeneralEmpresa { get { return new Paginas("index_DescGeneralEmpresa.aspx"); } }
        public static Paginas index_DescripcionSocioDemografica { get { return new Paginas("index_DescripcionSocioDemografica.aspx"); } }
        public static Paginas index_GestionLaboral { get { return new Paginas("index_GestionLaboral.aspx"); } }
        public static Paginas index_Inventario_EPP { get { return new Paginas("index_Inventario_EPP.aspx"); } }
        public static Paginas index_Inspecciones { get { return new Paginas("index_Inspecciones.aspx"); } }
        public static Paginas index_IncidenteLaboral { get { return new Paginas("index_IncidenteLaboral.aspx"); } }
        public static Paginas index_IdentificacionPeligros { get { return new Paginas("index_IdentificacionPeligros.aspx"); } }
        public static Paginas index_IdentificacionRiesgos { get { return new Paginas("index_IdentificacionRiesgos.aspx"); } }
        public static Paginas index_InvestigacionAccidente { get { return new Paginas("index_InvestigacionAccidente.aspx"); } }
        public static Paginas index_InvestigacionIncidente { get { return new Paginas("index_InvestigacionIncidente.aspx"); } }
        public static Paginas index_Obligaciones { get { return new Paginas("index_Obligaciones.aspx"); } }
        public static Paginas index_PlanCapacitacion { get { return new Paginas("index_PlanCapacitacion.aspx"); } }
        public static Paginas index_PuestoTrabajo { get { return new Paginas("index_PuestoTrabajo.aspx"); } }
        public static Paginas index_PlanillaEntregaEpp { get { return new Paginas("index_PlanillaEntregaEpp.aspx"); } }
        public static Paginas index_PerfilCargo { get { return new Paginas("index_PerfilCargo.aspx"); } }
        public static Paginas index_ProgramaInspecciones { get { return new Paginas("index_ProgramaInspecciones.aspx"); } }
        public static Paginas index_Politica_SST { get { return new Paginas("index_Politica_SST.aspx"); } }
        public static Paginas index_Plan_Evacuacion { get { return new Paginas("index_Plan_Evacuacion.aspx"); } }
        public static Paginas index_RecursosEconomicos { get { return new Paginas("index_RecursosEconomicos.aspx"); } }
        public static Paginas index_ReporteTrabajadores { get { return new Paginas("index_ReporteTrabajadores.aspx"); } }
        public static Paginas index_Trabajador { get { return new Paginas("index_Trabajador.aspx"); } }
        public static Paginas index_MatrizLegal { get { return new Paginas("index_MatrizLegal.aspx"); } }
        public static Paginas index_MatrizRiesgos { get { return new Paginas("index_MatrizRiesgos.aspx"); } }
        public static Paginas index_VigilanciaEpidemiologica { get { return new Paginas("index_VigilanciaEpidemiologica.aspx"); } }

        public static Paginas create_AnalisisVulnerabilidad { get { return new Paginas("create_AnalisisVulnerabilidad.aspx"); } }
        public static Paginas Create_AccidenteLaboral { get { return new Paginas("Create_AccidenteLaboral.aspx"); } }
        public static Paginas Create_AperturaElecciones { get { return new Paginas("Create_AperturaElecciones.aspx"); } }
        public static Paginas Create_ActaCierre { get { return new Paginas("Create_ActaCierre.aspx"); } }
        public static Paginas create_AutoEvaluacion { get { return new Paginas("create_AutoEvaluacion.aspx"); } }
        public static Paginas Create_ComunicadoElecciones { get { return new Paginas("Create_ComunicadoElecciones.aspx"); } }
        public static Paginas Create_ConformacionCopasst { get { return new Paginas("Create_ConformacionCopasst.aspx"); } }
        public static Paginas Create_DescripcionSocioDemografica { get { return new Paginas("Create_DescripcionSocioDemografica.aspx"); } }
        public static Paginas Create_DesignacionVigia { get { return new Paginas("Create_DesignacionVigia.aspx"); } }
        public static Paginas Create_Empresa { get { return new Paginas("Create_Empresa.aspx"); } }
        public static Paginas Create_EvaluacionRiesgos { get { return new Paginas("Create_EvaluacionRiesgos.aspx"); } }
        public static Paginas Create_ExamenLaboral { get { return new Paginas("Create_ExamenLaboral.aspx"); } }
        public static Paginas Create_EncuestaPoliticaSST { get { return new Paginas("Create_EncuestaPoliticaSST.aspx"); } }
        public static Paginas Create_Encuesta_ObjPoliticaSST { get { return new Paginas("Create_Encuesta_ObjPoliticaSST.aspx"); } }
        public static Paginas Create_FormatoVotos { get { return new Paginas("Create_FormatoVotos.aspx"); } }
        public static Paginas Create_InscripcionCandidatos { get { return new Paginas("Create_InscripcionCandidatos.aspx"); } }
        public static Paginas Create_IdentificacionPeligro { get { return new Paginas("Create_IdentificacionPeligro.aspx"); } }
        public static Paginas Create_InvestigacionIncidente { get { return new Paginas("Create_InvestigacionIncidente.aspx"); } }
        public static Paginas Create_IncidenteLaboral { get { return new Paginas("Create_IncidenteLaboral.aspx"); } }
        public static Paginas Create_InvestigacionAccidente { get { return new Paginas("Create_InvestigacionAccidente.aspx"); } }
        public static Paginas create_InspeccionExtintores { get { return new Paginas("create_InspeccionExtintores.aspx"); } }
        public static Paginas create_InspeccionAreas { get { return new Paginas("create_InspeccionAreas.aspx"); } }
        public static Paginas create_InspeccionMediosEscape { get { return new Paginas("create_InspeccionMediosEscape.aspx"); } }
        public static Paginas create_InspeccionPuestos { get { return new Paginas("create_InspeccionPuestos.aspx"); } }
        public static Paginas create_InspeccionPuestosAdmin { get { return new Paginas("create_InspeccionPuestosAdmin.aspx"); } }
        public static Paginas create_InspeccionEPP { get { return new Paginas("create_InspeccionEPP.aspx"); } }
        public static Paginas create_InspeccionCrono { get { return new Paginas("create_InspeccionCrono.aspx"); } }
        public static Paginas create_InspeccionUsoEpp { get { return new Paginas("create_InspeccionUsoEpp.aspx"); } }
        public static Paginas create_InspeccionPrimAux { get { return new Paginas("create_InspeccionPrimAux.aspx"); } }
        public static Paginas Create_RegistroVotantes { get { return new Paginas("Create_RegistroVotantes.aspx"); } }
        public static Paginas Create_ResultadoVotos { get { return new Paginas("Create_ResultadoVotos.aspx"); } }
        public static Paginas Create_ReunionCopasst { get { return new Paginas("Create_ReunionCopasst.aspx"); } }
        public static Paginas Create_Sucursal { get { return new Paginas("Create_Sucursal.aspx"); } }
        public static Paginas Create_Trabajador { get { return new Paginas("Create_Trabajador.aspx"); } }
        public static Paginas create_ReporteTrabajadoresA { get { return new Paginas("create_ReporteTrabajadoresA.aspx"); } }
        public static Paginas create_ReporteTrabajadoresB { get { return new Paginas("create_ReporteTrabajadoresB.aspx"); } }
        public static Paginas create_ReporteTrabajadoresC { get { return new Paginas("create_ReporteTrabajadoresC.aspx"); } }
        public static Paginas Create_RecursosEconomicos { get { return new Paginas("Create_RecursosEconomicos.aspx"); } }
        public static Paginas Create_PuestoTrabajo { get { return new Paginas("Create_PuestoTrabajo.aspx"); } }
        public static Paginas create_PlanillaEntregaEpp { get { return new Paginas("create_PlanillaEntregaEpp.aspx"); } }
        public static Paginas create_VigilanciaEpidemiologica { get { return new Paginas("create_VigilanciaEpidemiologica.aspx"); } }


        public static Paginas Update_Empresa { get { return new Paginas("Update_Empresa.aspx"); } }
        public static Paginas Update_Accidentes { get { return new Paginas("Update_Accidentes.aspx"); } }
        public static Paginas Update_Incidentes { get { return new Paginas("Update_Incidentes.aspx"); } }
        public static Paginas Update_PuestoTrabajo { get { return new Paginas("Update_PuestoTrabajo.aspx"); } }
        public static Paginas Update_Trabajador { get { return new Paginas("Update_Trabajador.aspx"); } }
        public static Paginas Update_MedidasMatrizLegal { get { return new Paginas("Update_MedidasMatrizLegal.aspx"); } }
        public static Paginas Update_MedidasMatrizRiesgos { get { return new Paginas("Update_MedidasMatrizRiesgos.aspx"); } }
        public static Paginas Update_AsistenciaCapacitacion { get { return new Paginas("Update_AsistenciaCapacitacion.aspx"); } }

        public static Paginas View_IdentificacionPeligros { get { return new Paginas("View_IdentificacionPeligros.aspx"); } }
        public static Paginas View_Incidente { get { return new Paginas("View_Incidente.aspx"); } }
        public static Paginas View_Accidente { get { return new Paginas("View_Accidente.aspx"); } }
        public static Paginas View_InvestigacionAccidente { get { return new Paginas("View_InvestigacionAccidente.aspx"); } }
        public static Paginas View_InvestigacionIncidente { get { return new Paginas("View_InvestigacionIncidente.aspx"); } }
        public static Paginas View_PuestoTrabajo { get { return new Paginas("View_PuestoTrabajo.aspx"); } }
        public static Paginas View_DescripcionSocioDemografica { get { return new Paginas("View_DescripcionSocioDemografica.aspx"); } }
        public static Paginas View_GestionLaboral { get { return new Paginas("View_GestionLaboral.aspx"); } }
        public static Paginas View_EvaluacionPuesto { get { return new Paginas("View_EvaluacionPuesto.aspx"); } }

        public static Paginas Archivos_Autoevaluacion { get { return new Paginas("~/archivos/autoevaluacion/"); } }
        public static Paginas Archivos_Inspecciones { get { return new Paginas("~/archivos/inspecciones/"); } }
        public static Paginas Archivos_ReporteTrabajadores { get { return new Paginas("~/archivos/reportes/"); } }
        public static Paginas Archivos_LogosEmpresas { get { return new Paginas("~/archivos/LogosEmpresas/"); } }
        public static Paginas Archivos_PuestoTrabajo { get { return new Paginas("~/archivos/puesto_trabajo/"); } }
        public static Paginas Archivos_Foto_Perfil { get { return new Paginas("~/archivos/foto_perfil/"); } }
        public static Paginas Archivos_Indicadores { get { return new Paginas("~/archivos/indicadores/"); } }

        public static Paginas URL_Señalizacion { get { return new Paginas("~/ico/epp/"); } }

        public static Paginas Update_DescripcionSocioDemografica { get { return new Paginas("Update_DescripcionSocioDemografica.aspx"); } }

    }
}
