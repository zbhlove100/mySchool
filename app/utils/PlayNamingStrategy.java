package utils;

import org.hibernate.cfg.EJB3NamingStrategy;

public class PlayNamingStrategy extends EJB3NamingStrategy
{
	@Override
	public String propertyToColumnName(String propertyName) {
		return addUnderscores(propertyName);
	}
//	@Override
//	public String collectionTableName(String ownerEntity, String ownerEntityTable, String associatedEntity, String associatedEntityTable, String propertyName)
//	{
//		 java.lang.System.out.println("**************"+ownerEntity+"==>"+associatedEntity);
//		 return tableName(ownerEntityTable + "_" + (associatedEntityTable != null ? associatedEntityTable : StringHelper.unqualify(propertyName)));
////	     //return tableName((associatedEntityTable != null ? associatedEntityTable : StringHelper.unqualify(propertyName)));
//	}
	  
	protected static String addUnderscores(String name) {
		StringBuffer buf = new StringBuffer(name.replace('.', '_'));
		for (int i = 1; i < buf.length() - 1; i++) {
			if ((!Character.isLowerCase(buf.charAt(i - 1)))
					|| (!Character.isUpperCase(buf.charAt(i)))
					|| (!Character.isLowerCase(buf.charAt(i + 1)))) {
				continue;
			}

			buf.insert(i++, '_');
		}
		return buf.toString().toLowerCase();
	}

}
