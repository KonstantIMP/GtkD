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


module gtk.BuildableT;

public  import glib.Str;
public  import gtk.c.functions;
public  import gtk.c.types;


/**
 * GtkBuildable allows objects to extend and customize their deserialization
 * from [GtkBuilder UI descriptions][BUILDER-UI].
 * The interface includes methods for setting names and properties of objects,
 * parsing custom tags and constructing child objects.
 * 
 * The GtkBuildable interface is implemented by all widgets and
 * many of the non-widget objects that are provided by GTK. The
 * main user of this interface is #GtkBuilder. There should be
 * very little need for applications to call any of these functions directly.
 * 
 * An object only needs to implement this interface if it needs to extend the
 * #GtkBuilder format or run any extra routines at deserialization time.
 */
public template BuildableT(TStruct)
{
	/** Get the main Gtk struct */
	public GtkBuildable* getBuildableStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GtkBuildable*)getStruct();
	}


	/**
	 * Gets the ID of the @buildable object.
	 *
	 * #GtkBuilder sets the name based on the
	 * [GtkBuilder UI definition][BUILDER-UI]
	 * used to construct the @buildable.
	 *
	 * Returns: the ID set with gtk_buildable_set_buildable_id()
	 */
	public string getBuildableId()
	{
		return Str.toString(gtk_buildable_get_buildable_id(getBuildableStruct()));
	}
}
