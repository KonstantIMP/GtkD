/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */

// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage


module gtk.BuilderScopeT;

public  import gtk.c.functions;
public  import gtk.c.types;


/**
 * #GtkBuilderScope is an interface to provide support to #GtkBuilder, primarily
 * for looking up programming-language-specific values for strings that are
 * given in a #GtkBuilder UI file.
 * 
 * The primary intended audience is bindings that want to provide deeper integration
 * of #GtkBuilder into the language.
 * 
 * A #GtkBuilderScope instance may be used with multiple #GtkBuilder objects, even
 * at once.
 * 
 * By default, GTK will use its own implementation of #GtkBuilderScope for the C
 * language which can be created via gtk_builder_cscope_new().
 * 
 * #GtkBuilderCScope instances use symbols explicitly added to @builder
 * with prior calls to gtk_builder_cscope_add_callback_symbol(). If developers want
 * to do that, they are encouraged to create their own scopes for that purpose.
 * 
 * In the case that symbols are not explicitly added; GTK will uses #GModule’s
 * introspective features (by opening the module %NULL) to look at the application’s
 * symbol table. From here it tries to match the signal function names given in the
 * interface description with symbols in the application.
 * 
 * Note that unless gtk_builder_cscope_add_callback_symbol() is called for
 * all signal callbacks which are referenced by the loaded XML, this
 * functionality will require that #GModule be supported on the platform.
 */
public template BuilderScopeT(TStruct)
{
	/** Get the main Gtk struct */
	public GtkBuilderScope* getBuilderScopeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GtkBuilderScope*)getStruct();
	}

}
