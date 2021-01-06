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


module gtk.DragSource;

private import gdk.ContentProvider;
private import gdk.Drag;
private import gdk.PaintableIF;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.GestureSingle;
private import gtk.c.functions;
public  import gtk.c.types;
private import std.algorithm;


/**
 * GtkDragSource is an auxiliary object that is used to initiate
 * Drag-And-Drop operations. It can be set up with the necessary
 * ingredients for a DND operation ahead of time. This includes
 * the source for the data that is being transferred, in the form
 * of a #GdkContentProvider, the desired action, and the icon to
 * use during the drag operation. After setting it up, the drag
 * source must be added to a widget as an event controller, using
 * gtk_widget_add_controller().
 * 
 * Setting up the content provider and icon ahead of time only
 * makes sense when the data does not change. More commonly, you
 * will want to set them up just in time. To do so, #GtkDragSource
 * has #GtkDragSource::prepare and #GtkDragSource::drag-begin signals.
 * The ::prepare signal is emitted before a drag is started, and
 * can be used to set the content provider and actions that the
 * drag should be started with. The ::drag-begin signal is emitted
 * after the #GdkDrag object has been created, and can be used
 * to set up the drag icon.
 * 
 * During the DND operation, GtkDragSource emits signals that
 * can be used to obtain updates about the status of the operation,
 * but it is not normally necessary to connect to any signals,
 * except for one case: when the supported actions include
 * %GDK_ACTION_MOVE, you need to listen for the
 * #GtkDragSource::drag-end signal and delete the
 * data after it has been transferred.
 */
public class DragSource : GestureSingle
{
	/** the main Gtk struct */
	protected GtkDragSource* gtkDragSource;

	/** Get the main Gtk struct */
	public GtkDragSource* getDragSourceStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkDragSource;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkDragSource;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkDragSource* gtkDragSource, bool ownedRef = false)
	{
		this.gtkDragSource = gtkDragSource;
		super(cast(GtkGestureSingle*)gtkDragSource, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_drag_source_get_type();
	}

	/**
	 * Creates a new #GtkDragSource object.
	 *
	 * Returns: the new #GtkDragSource
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_drag_source_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkDragSource*) __p, true);
	}

	/**
	 * Cancels a currently ongoing drag operation.
	 */
	public void dragCancel()
	{
		gtk_drag_source_drag_cancel(gtkDragSource);
	}

	/**
	 * Gets the actions that are currently set on the #GtkDragSource.
	 *
	 * Returns: the actions set on @source
	 */
	public GdkDragAction getActions()
	{
		return gtk_drag_source_get_actions(gtkDragSource);
	}

	/**
	 * Gets the current content provider of a #GtkDragSource.
	 *
	 * Returns: the #GdkContentProvider of @source
	 */
	public ContentProvider getContent()
	{
		auto __p = gtk_drag_source_get_content(gtkDragSource);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ContentProvider)(cast(GdkContentProvider*) __p);
	}

	/**
	 * Returns the underlying #GdkDrag object for an ongoing drag.
	 *
	 * Returns: the #GdkDrag of the current drag operation, or %NULL
	 */
	public Drag getDrag()
	{
		auto __p = gtk_drag_source_get_drag(gtkDragSource);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Drag)(cast(GdkDrag*) __p);
	}

	/**
	 * Sets the actions on the #GtkDragSource.
	 *
	 * During a DND operation, the actions are offered
	 * to potential drop targets. If @actions include
	 * %GDK_ACTION_MOVE, you need to listen to the
	 * #GtkDragSource::drag-end signal and handle
	 * @delete_data being %TRUE.
	 *
	 * This function can be called before a drag is started,
	 * or in a handler for the #GtkDragSource::prepare signal.
	 *
	 * Params:
	 *     actions = the actions to offer
	 */
	public void setActions(GdkDragAction actions)
	{
		gtk_drag_source_set_actions(gtkDragSource, actions);
	}

	/**
	 * Sets a content provider on a #GtkDragSource.
	 *
	 * When the data is requested in the cause of a
	 * DND operation, it will be obtained from the
	 * content provider.
	 *
	 * This function can be called before a drag is started,
	 * or in a handler for the #GtkDragSource::prepare signal.
	 *
	 * You may consider setting the content provider back to
	 * %NULL in a #GtkDragSource::drag-end signal handler.
	 *
	 * Params:
	 *     content = a #GdkContentProvider, or %NULL
	 */
	public void setContent(ContentProvider content)
	{
		gtk_drag_source_set_content(gtkDragSource, (content is null) ? null : content.getContentProviderStruct());
	}

	/**
	 * Sets a paintable to use as icon during DND operations.
	 *
	 * The hotspot coordinates determine the point on the icon
	 * that gets aligned with the hotspot of the cursor.
	 *
	 * If @paintable is %NULL, a default icon is used.
	 *
	 * This function can be called before a drag is started, or in
	 * a #GtkDragSource::prepare or #GtkDragSource::drag-begin signal handler.
	 *
	 * Params:
	 *     paintable = the #GdkPaintable to use as icon, or %NULL
	 *     hotX = the hotspot X coordinate on the icon
	 *     hotY = the hotspot Y coordinate on the icon
	 */
	public void setIcon(PaintableIF paintable, int hotX, int hotY)
	{
		gtk_drag_source_set_icon(gtkDragSource, (paintable is null) ? null : paintable.getPaintableStruct(), hotX, hotY);
	}

	/**
	 * The ::drag-begin signal is emitted on the drag source when a drag
	 * is started. It can be used to e.g. set a custom drag icon with
	 * gtk_drag_source_set_icon().
	 *
	 * Params:
	 *     drag = the #GdkDrag object
	 */
	gulong addOnDragBegin(void delegate(Drag, DragSource) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "drag-begin", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * The ::drag-cancel signal is emitted on the drag source when a drag has
	 * failed. The signal handler may handle a failed drag operation based on
	 * the type of error. It should return %TRUE if the failure has been handled
	 * and the default "drag operation failed" animation should not be shown.
	 *
	 * Params:
	 *     drag = the #GdkDrag object
	 *     reason = information on why the drag failed
	 *
	 * Returns: %TRUE if the failed drag operation has been already handled
	 */
	gulong addOnDragCancel(bool delegate(Drag, GdkDragCancelReason, DragSource) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "drag-cancel", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * The ::drag-end signal is emitted on the drag source when a drag is
	 * finished. A typical reason to connect to this signal is to undo
	 * things done in #GtkDragSource::prepare or #GtkDragSource::drag-begin.
	 *
	 * Params:
	 *     drag = the #GdkDrag object
	 *     deleteData = %TRUE if the drag was performing %GDK_ACTION_MOVE,
	 *         and the data should be deleted
	 */
	gulong addOnDragEnd(void delegate(Drag, bool, DragSource) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "drag-end", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * The ::prepare signal is emitted when a drag is about to be initiated.
	 * It returns the * #GdkContentProvider to use for the drag that is about
	 * to start. The default handler for this signal returns the value of
	 * the #GtkDragSource:content property, so if you set up that property
	 * ahead of time, you don't need to connect to this signal.
	 *
	 * Params:
	 *     x = the X coordinate of the drag starting point
	 *     y = the Y coordinate fo the drag starting point
	 *
	 * Returns: a #GdkContentProvider, or %NULL
	 */
	gulong addOnPrepare(ContentProvider delegate(double, double, DragSource) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "prepare", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
