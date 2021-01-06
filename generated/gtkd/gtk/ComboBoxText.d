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


module gtk.ComboBoxText;

private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.ComboBox;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * A GtkComboBoxText is a simple variant of #GtkComboBox that hides
 * the model-view complexity for simple text-only use cases.
 * 
 * To create a GtkComboBoxText, use gtk_combo_box_text_new() or
 * gtk_combo_box_text_new_with_entry().
 * 
 * You can add items to a GtkComboBoxText with
 * gtk_combo_box_text_append_text(), gtk_combo_box_text_insert_text()
 * or gtk_combo_box_text_prepend_text() and remove options with
 * gtk_combo_box_text_remove().
 * 
 * If the GtkComboBoxText contains an entry (via the “has-entry” property),
 * its contents can be retrieved using gtk_combo_box_text_get_active_text().
 * The entry itself can be accessed by calling gtk_bin_get_child() on the
 * combo box.
 * 
 * You should not call gtk_combo_box_set_model() or attempt to pack more cells
 * into this combo box via its GtkCellLayout interface.
 * 
 * # GtkComboBoxText as GtkBuildable
 * 
 * The GtkComboBoxText implementation of the GtkBuildable interface supports
 * adding items directly using the <items> element and specifying <item>
 * elements for each item. Each <item> element can specify the “id”
 * corresponding to the appended text and also supports the regular
 * translation attributes “translatable”, “context” and “comments”.
 * 
 * Here is a UI definition fragment specifying GtkComboBoxText items:
 * |[
 * <object class="GtkComboBoxText">
 * <items>
 * <item translatable="yes" id="factory">Factory</item>
 * <item translatable="yes" id="home">Home</item>
 * <item translatable="yes" id="subway">Subway</item>
 * </items>
 * </object>
 * ]|
 * 
 * # CSS nodes
 * 
 * |[<!-- language="plain" -->
 * combobox
 * ╰── box.linked
 * ├── entry.combo
 * ├── button.combo
 * ╰── window.popup
 * ]|
 * 
 * GtkComboBoxText has a single CSS node with name combobox. It adds
 * the style class .combo to the main CSS nodes of its entry and button
 * children, and the .linked class to the node of its internal box.
 */
public class ComboBoxText : ComboBox
{
	/** the main Gtk struct */
	protected GtkComboBoxText* gtkComboBoxText;

	/** Get the main Gtk struct */
	public GtkComboBoxText* getComboBoxTextStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkComboBoxText;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkComboBoxText;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkComboBoxText* gtkComboBoxText, bool ownedRef = false)
	{
		this.gtkComboBoxText = gtkComboBoxText;
		super(cast(GtkComboBox*)gtkComboBoxText, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_combo_box_text_get_type();
	}

	/**
	 * Creates a new #GtkComboBoxText, which is a #GtkComboBox just displaying
	 * strings.
	 *
	 * Returns: A new #GtkComboBoxText
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_combo_box_text_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkComboBoxText*) __p);
	}

	/**
	 * Creates a new #GtkComboBoxText, which is a #GtkComboBox just displaying
	 * strings. The combo box created by this function has an entry.
	 *
	 * Returns: a new #GtkComboBoxText
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_combo_box_text_new_with_entry();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_with_entry");
		}

		this(cast(GtkComboBoxText*) __p);
	}

	/**
	 * Appends @text to the list of strings stored in @combo_box.
	 * If @id is non-%NULL then it is used as the ID of the row.
	 *
	 * This is the same as calling gtk_combo_box_text_insert() with a
	 * position of -1.
	 *
	 * Params:
	 *     id = a string ID for this value, or %NULL
	 *     text = A string
	 */
	public void append(string id, string text)
	{
		gtk_combo_box_text_append(gtkComboBoxText, Str.toStringz(id), Str.toStringz(text));
	}

	/**
	 * Appends @text to the list of strings stored in @combo_box.
	 *
	 * This is the same as calling gtk_combo_box_text_insert_text() with a
	 * position of -1.
	 *
	 * Params:
	 *     text = A string
	 */
	public void appendText(string text)
	{
		gtk_combo_box_text_append_text(gtkComboBoxText, Str.toStringz(text));
	}

	/**
	 * Returns the currently active string in @combo_box, or %NULL
	 * if none is selected. If @combo_box contains an entry, this
	 * function will return its contents (which will not necessarily
	 * be an item from the list).
	 *
	 * Returns: a newly allocated string containing the
	 *     currently active text. Must be freed with g_free().
	 */
	public string getActiveText()
	{
		auto retStr = gtk_combo_box_text_get_active_text(gtkComboBoxText);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Inserts @text at @position in the list of strings stored in @combo_box.
	 * If @id is non-%NULL then it is used as the ID of the row.  See
	 * #GtkComboBox:id-column.
	 *
	 * If @position is negative then @text is appended.
	 *
	 * Params:
	 *     position = An index to insert @text
	 *     id = a string ID for this value, or %NULL
	 *     text = A string to display
	 */
	public void insert(int position, string id, string text)
	{
		gtk_combo_box_text_insert(gtkComboBoxText, position, Str.toStringz(id), Str.toStringz(text));
	}

	/**
	 * Inserts @text at @position in the list of strings stored in @combo_box.
	 *
	 * If @position is negative then @text is appended.
	 *
	 * This is the same as calling gtk_combo_box_text_insert() with a %NULL
	 * ID string.
	 *
	 * Params:
	 *     position = An index to insert @text
	 *     text = A string
	 */
	public void insertText(int position, string text)
	{
		gtk_combo_box_text_insert_text(gtkComboBoxText, position, Str.toStringz(text));
	}

	/**
	 * Prepends @text to the list of strings stored in @combo_box.
	 * If @id is non-%NULL then it is used as the ID of the row.
	 *
	 * This is the same as calling gtk_combo_box_text_insert() with a
	 * position of 0.
	 *
	 * Params:
	 *     id = a string ID for this value, or %NULL
	 *     text = a string
	 */
	public void prepend(string id, string text)
	{
		gtk_combo_box_text_prepend(gtkComboBoxText, Str.toStringz(id), Str.toStringz(text));
	}

	/**
	 * Prepends @text to the list of strings stored in @combo_box.
	 *
	 * This is the same as calling gtk_combo_box_text_insert_text() with a
	 * position of 0.
	 *
	 * Params:
	 *     text = A string
	 */
	public void prependText(string text)
	{
		gtk_combo_box_text_prepend_text(gtkComboBoxText, Str.toStringz(text));
	}

	/**
	 * Removes the string at @position from @combo_box.
	 *
	 * Params:
	 *     position = Index of the item to remove
	 */
	public void remove(int position)
	{
		gtk_combo_box_text_remove(gtkComboBoxText, position);
	}

	/**
	 * Removes all the text entries from the combo box.
	 */
	public void removeAll()
	{
		gtk_combo_box_text_remove_all(gtkComboBoxText);
	}
}
