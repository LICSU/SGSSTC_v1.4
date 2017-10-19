using System;
using System.Linq;

namespace Capa_Datos
{
    /// <summary>
    /// Descripción breve de GetterMax
    /// </summary>
    public class GetterMax
    {
        public GetterMax()
        {
            //
            // TODO: Agregar aquí la lógica del constructor
            //
        }

        public static int Accidentes()
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new Respuesta();
            int id = contexto.at_it_el_pa.Max(x => x.id_at_it_el_pa);
            return id;
        }
        public static int BrigadaEmergencias(int _id_sucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new brigada_emergencia();
            int id = 0;

            if (contexto.brigada_emergencia.Where(x => x.id_sucursal == _id_sucursal).Count() != 0)
            {
                id = contexto.brigada_emergencia.Where(x => x.id_sucursal == _id_sucursal).Max(x => x.id_brigada);
            }

            return id;
        }

        public static int Roles()
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new rol();
            return contexto.rol.Max(x => x.id_rol);
        }

        public static int DescripcionSociodemografica()
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new desc_socio();
            int id = contexto.desc_socio.Max(x => x.id_desc_socio);
            return id;
        }
        public static int GestionLaboral()
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new gestion_laboral();
            int id = contexto.gestion_laboral.Max(x => x.id_ges_lab);
            return id;
        }
        public static int Horario()
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new horario();
            int id = contexto.horario.Max(x => x.id_horario);
            return id;
        }
        public static int HistoriaClinica()
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            int id = 0;
            var count = (from hco in contexto.historia_clinica_ocupacional
                         select hco).Count();

            if (Convert.ToInt32(count) > 0)
            {
                var consulta = new historia_clinica_ocupacional();
                id = contexto.historia_clinica_ocupacional.Max(x => x.id_his_cli_ocu);
            }
            return id;
        }
        public static int MatrizResponsabilidad(int _id_sucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new matriz_responsabilidad();
            int id = 0;

            if (contexto.matriz_responsabilidad.Where(x => x.id_sucursal == _id_sucursal).Count() != 0)
            {
                id = contexto.matriz_responsabilidad.Where(x => x.id_sucursal == _id_sucursal).Max(x => x.id_matriz_responsabilidad);
            }

            return id;
        }
        public static int Plan(int _id_sucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new plan();
            int id = 0;

            if (contexto.plan.Where(x => x.id_sucursal == _id_sucursal).Count() != 0)
            {
                id = contexto.plan.Where(x => x.id_sucursal == _id_sucursal).Max(x => x.id_plan);
            }

            return id;
        }
        public static int PuestoTrabajo()
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new puesto_trabajo();
            int id = contexto.puesto_trabajo.Max(x => x.id_puesto_trabajo);
            return id;
        }
        public static int PoliticaSST(int _id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new usuario();
            try
            {
                int id = contexto.politica_sst.Where(x => x.id_empresa == _id_empresa).Max(x => x.id_politica);
                return id;
            }
            catch (Exception ex) {
                return 0;
            }              
        }
        public static int RecursosEconmicos(int _id_sucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new documento();
            int id = 0;

            if (contexto.documento.Where(x => x.id_tabla == _id_sucursal && x.tipo == "RecursosEconomicos").Count() != 0)
            {
                id = contexto.documento
                    .Where(x => x.id_tabla == _id_sucursal && x.tipo == "RecursosEconomicos")
                    .Max(x => x.id_documento);
            }

            return id;
        }
        public static int Usuario()
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new usuario();
            int id = contexto.usuario.Max(x => x.id_usuario);
            return id;
        }
        public static int IdentificacionPeligro()
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new identificacion_peligro();
            return contexto.identificacion_peligro.Max(x => x.id_identificacion_peligro);
        }
    }
}
