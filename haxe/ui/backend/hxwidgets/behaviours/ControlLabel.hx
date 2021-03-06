package haxe.ui.backend.hxwidgets.behaviours;

import haxe.ui.util.Variant;
import hx.widgets.Bitmap;
import hx.widgets.Control;
import hx.widgets.Button;
import hx.widgets.StaticText;
import hx.widgets.TextCtrl;

@:keep
@:access(haxe.ui.core.Component)
class ControlLabel extends HxWidgetsBehaviour {
    public override function set(value:Variant) {
        super.set(value);
        if (_component.window == null) {
            return;
        }

        var ctrl:Control = cast _component.window;
        if (value.isNull == false) {
            ctrl.label = value;
            _component.invalidateLayout();
        }

        /*
        if (Std.is(_component, haxe.ui.components.Button)) {
            if (cast(_component, haxe.ui.components.Button).icon != null) {
                var b:Button = cast _component.window;
                b.bitmap = Bitmap.fromHaxeResource(cast(_component, haxe.ui.components.Button).icon);
            }
        }
        */

        /*

        var invalidate:Bool = false;

        var ctrl:Control = cast _component.window;
        if (value.isNull == false) {
            ctrl.label = value;
            invalidate = true;
            _component.invalidate(InvalidationFlags.LAYOUT);
        }

        if (Std.is(_component, haxe.ui.components.Button)) {
            if (cast(_component, haxe.ui.components.Button).icon != null) {
                var b:Button = cast _component.window;
                b.setBitmap(Bitmap.fromHaxeResource(cast(_component, haxe.ui.components.Button).icon));
            }
        }

        if (Std.is(_component, haxe.ui.components.Label)) {
            var l:StaticText = cast _component.window;
            //l.freeze();
            //_component.lock();
            l.wrap(Std.int(_component.width));
            _component.invalidate(InvalidationFlags.LAYOUT);
            //l.thaw();
            //_component.unlock();
            invalidate = true;
        }
        */

        if (Std.is(_component, haxe.ui.components.Label)) {
            var l:StaticText = cast _component.window;
            l.wrap(Std.int(_component.componentWidth));
            _component.invalidateLayout();
        }
    }

    public override function get():Variant {
        /*
        if (_component.window == null) {
            return null;
        }
        var ctrl:Control = cast _component.window;
        */
        if (_component.window == null) {
            return null;
        }

        if (Std.is(_component.window, TextCtrl)) {
            var textctrl:TextCtrl = cast _component.window;
            return textctrl.value;
        }

        var ctrl:Control = cast _component.window;
        return ctrl.label;
    }
}