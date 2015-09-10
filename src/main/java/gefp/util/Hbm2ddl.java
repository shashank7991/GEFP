package gefp.util;

import java.util.HashMap;

import org.hibernate.cfg.Configuration;
import org.hibernate.ejb.Ejb3Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

@SuppressWarnings("deprecation")
public class Hbm2ddl {

	public static void main(String args[]) {

		Configuration cfg = (new Ejb3Configuration()).configure("gefp",
				new HashMap<String, Object>()).getHibernateConfiguration();

		SchemaExport schemaExport = new SchemaExport(cfg);
		schemaExport.setOutputFile("src/main/scripts/gefp.sql")
				.setDelimiter(";").setFormat(true).setHaltOnError(true);

		schemaExport.execute(true, false, false, true);

		System.out.println("Done.");
	}

}
