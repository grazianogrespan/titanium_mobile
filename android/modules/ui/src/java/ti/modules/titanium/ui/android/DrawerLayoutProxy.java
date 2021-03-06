/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2017 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
package ti.modules.titanium.ui.android;

import ti.modules.titanium.ui.widget.TiUIDrawerLayout;

import org.appcelerator.kroll.annotations.Kroll;
import org.appcelerator.kroll.common.Log;
import org.appcelerator.kroll.KrollProxy;
import org.appcelerator.titanium.proxy.TiViewProxy;
import org.appcelerator.titanium.TiApplication;
import org.appcelerator.titanium.TiC;
import org.appcelerator.titanium.util.TiConvert;
import org.appcelerator.titanium.view.TiUIView;

import android.app.Activity;
import android.os.Message;
import android.support.v4.widget.DrawerLayout;

@Kroll.proxy(creatableInModule = AndroidModule.class)
public class DrawerLayoutProxy extends TiViewProxy
{
    @Kroll.constant public static final int LOCK_MODE_LOCKED_CLOSED = DrawerLayout.LOCK_MODE_LOCKED_CLOSED;
    @Kroll.constant public static final int LOCK_MODE_LOCKED_OPEN = DrawerLayout.LOCK_MODE_LOCKED_OPEN;
    @Kroll.constant public static final int LOCK_MODE_UNLOCKED = DrawerLayout.LOCK_MODE_UNLOCKED;
<<<<<<< HEAD
    @Kroll.constant public static final int LOCK_MODE_UNDEFINED = DrawerLayout.LOCK_MODE_UNDEFINED;
=======
>>>>>>> 8d03624a669338ceab837242c6fefd23c1b1380f

    private static final String TAG = "DrawerLayoutProxy";

    private TiUIDrawerLayout drawer;

    public DrawerLayoutProxy() {
        super();
    }

    @Override
    public TiUIView createView(Activity activity) {
        drawer = new TiUIDrawerLayout(this);
        drawer.getLayoutParams().autoFillsHeight = true;
        drawer.getLayoutParams().autoFillsWidth = true;
        return drawer;
    }

    @Kroll.method(runOnUiThread=true)
    public void toggleLeft() {
<<<<<<< HEAD
        if (drawer != null) {
            drawer.toggleLeft();
        }
=======
        drawer.toggleLeft();
>>>>>>> 8d03624a669338ceab837242c6fefd23c1b1380f
    }

    @Kroll.method(runOnUiThread=true)
    public void openLeft() {
<<<<<<< HEAD
        if (drawer != null) {
            drawer.openLeft();
        }
=======
        drawer.openLeft();
>>>>>>> 8d03624a669338ceab837242c6fefd23c1b1380f
    }

    @Kroll.method(runOnUiThread=true)
    public void closeLeft() {
<<<<<<< HEAD
        if (drawer != null) {
            drawer.closeLeft();
        }
=======
        drawer.closeLeft();
>>>>>>> 8d03624a669338ceab837242c6fefd23c1b1380f
    }

    @Kroll.method(runOnUiThread=true)
    public void toggleRight() {
<<<<<<< HEAD
        if (drawer != null) {
            drawer.toggleRight();
        }
=======
        drawer.toggleRight();
>>>>>>> 8d03624a669338ceab837242c6fefd23c1b1380f
    }

    @Kroll.method(runOnUiThread=true)
    public void openRight() {
<<<<<<< HEAD
        if (drawer != null) {
            drawer.openRight();
        }
=======
        drawer.openRight();
>>>>>>> 8d03624a669338ceab837242c6fefd23c1b1380f
    }

    @Kroll.method(runOnUiThread=true)
    public void closeRight() {
<<<<<<< HEAD
        if (drawer != null) {
            drawer.closeRight();
        }
=======
        drawer.closeRight();
>>>>>>> 8d03624a669338ceab837242c6fefd23c1b1380f
    }

    @Kroll.method
    @Kroll.getProperty
    public boolean getIsLeftOpen() {
<<<<<<< HEAD
        return drawer != null && drawer.isLeftOpen();
=======
        return drawer.isLeftOpen();
>>>>>>> 8d03624a669338ceab837242c6fefd23c1b1380f
    }

    @Kroll.method
    @Kroll.getProperty
    public boolean getIsRightOpen() {
<<<<<<< HEAD
        return drawer != null && drawer.isRightOpen();
=======
        return drawer.isRightOpen();
>>>>>>> 8d03624a669338ceab837242c6fefd23c1b1380f
    }

    @Kroll.method
    @Kroll.getProperty
    public boolean getIsLeftVisible() {
<<<<<<< HEAD
        return drawer != null && drawer.isLeftVisible();
=======
        return drawer.isLeftVisible();
>>>>>>> 8d03624a669338ceab837242c6fefd23c1b1380f
    }

    @Kroll.method
    @Kroll.getProperty
    public boolean getIsRightVisible() {
<<<<<<< HEAD
        return drawer != null && drawer.isRightVisible();
=======
        return drawer.isRightVisible();
>>>>>>> 8d03624a669338ceab837242c6fefd23c1b1380f
    }

    @Kroll.method
    @Kroll.setProperty
    public void setLeftWidth(Object arg) {
        setPropertyAndFire(TiC.PROPERTY_LEFT_WIDTH, arg);
    }

    @Kroll.method
    @Kroll.setProperty
    public void setLeftView(Object arg) {
        setPropertyAndFire(TiC.PROPERTY_LEFT_VIEW, arg);
    }

    @Kroll.method
    @Kroll.setProperty
    public void setRightWidth(Object arg) {
        setPropertyAndFire(TiC.PROPERTY_RIGHT_WIDTH, arg);
    }

    @Kroll.method
    @Kroll.setProperty
    public void setRightView(Object arg) {
        setPropertyAndFire(TiC.PROPERTY_RIGHT_VIEW, arg);
    }

    @Kroll.method
    @Kroll.setProperty
    public void setCenterView(Object arg) {
        setPropertyAndFire(TiC.PROPERTY_CENTER_VIEW, arg);
    }

    @Kroll.method
<<<<<<< HEAD
    @Kroll.getProperty
    public boolean getDrawerIndicatorEnabled() {
        if (hasProperty(TiC.PROPERTY_DRAWER_INDICATOR_ENABLED)) {
            return (Boolean) getProperty(TiC.PROPERTY_DRAWER_INDICATOR_ENABLED);
        }
        return true;
    }

    @Kroll.method
=======
>>>>>>> 8d03624a669338ceab837242c6fefd23c1b1380f
    @Kroll.setProperty
    public void setDrawerIndicatorEnabled(Object arg) {
        setPropertyAndFire(TiC.PROPERTY_DRAWER_INDICATOR_ENABLED, arg);
    }

    @Kroll.method
<<<<<<< HEAD
    @Kroll.getProperty
    public int getDrawerLockMode() {
        if (hasProperty(TiC.PROPERTY_DRAWER_LOCK_MODE)) {
            return (Integer) getProperty(TiC.PROPERTY_DRAWER_LOCK_MODE);
        }
        return LOCK_MODE_UNDEFINED;
    }

    @Kroll.method
=======
>>>>>>> 8d03624a669338ceab837242c6fefd23c1b1380f
    @Kroll.setProperty
    public void setDrawerLockMode(Object arg) {
        setPropertyAndFire(TiC.PROPERTY_DRAWER_LOCK_MODE, arg);
    }

    @Kroll.method
    public void interceptTouchEvent (TiViewProxy view, Boolean disallowIntercept){
        view.getOrCreateView().getOuterView().getParent().requestDisallowInterceptTouchEvent(disallowIntercept);
    }

    @Kroll.method
<<<<<<< HEAD
    @Kroll.getProperty
    public boolean getToolbarEnabled() {
        if (hasProperty(TiC.PROPERTY_TOOLBAR_ENABLED)) {
            return (Boolean) getProperty(TiC.PROPERTY_TOOLBAR_ENABLED);
        }
        return true;
    }

    @Kroll.method
=======
>>>>>>> 8d03624a669338ceab837242c6fefd23c1b1380f
    @Kroll.setProperty
    public void setToolbarEnabled(Object arg) {
        setPropertyAndFire(TiC.PROPERTY_TOOLBAR_ENABLED, arg);
    }
}
