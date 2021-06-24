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


module gtk.TreeDragSourceIF;

private import gdk.ContentProvider;
private import gobject.ObjectG;
private import gtk.TreePath;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * Interface for Drag-and-Drop destinations in `GtkTreeView`.
 */
public interface TreeDragSourceIF{
	/** Get the main Gtk struct */
	public GtkTreeDragSource* getTreeDragSourceStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return gtk_tree_drag_source_get_type();
	}

	/**
	 * Asks the #GtkTreeDragSource to delete the row at @path, because
	 * it was moved somewhere else via drag-and-drop. Returns %FALSE
	 * if the deletion fails because @path no longer exists, or for
	 * some model-specific reason. Should robustly handle a @path no
	 * longer found in the model!
	 *
	 * Params:
	 *     path = row that was being dragged
	 *
	 * Returns: %TRUE if the row was successfully deleted
	 */
	public bool dragDataDelete(TreePath path);

	/**
	 * Asks the #GtkTreeDragSource to return a #GdkContentProvider representing
	 * the row at @path. Should robustly handle a @path no
	 * longer found in the model!
	 *
	 * Params:
	 *     path = row that was dragged
	 *
	 * Returns: a #GdkContentProvider for the
	 *     given @path or %NULL if none exists
	 */
	public ContentProvider dragDataGet(TreePath path);

	/**
	 * Asks the #GtkTreeDragSource whether a particular row can be used as
	 * the source of a DND operation. If the source doesn’t implement
	 * this interface, the row is assumed draggable.
	 *
	 * Params:
	 *     path = row on which user is initiating a drag
	 *
	 * Returns: %TRUE if the row can be dragged
	 */
	public bool rowDraggable(TreePath path);
}
