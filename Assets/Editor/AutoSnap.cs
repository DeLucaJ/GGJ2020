using UnityEngine;
using UnityEditor;

public class AutoSnap : EditorWindow
{
    private Vector3 prevPosition;
    private Vector3 prevScale;
    private Vector3 prevRotation;

    // These need to be static because the auto snap window is
    // recreated when opened from the menu
    private static bool doTranslateSnap = true;
    private static bool doScaleSnap = true;
    private static bool doRotateSnap = true;
    private static float snapScaleValue = 1.0f;
    private static float snapTranslateValue = 1.0f;
    private static float snapRotateValue = 11.25f;

    // We need to remember the window doing the snap updates
    // so it will do it when the window is closed
    private static AutoSnap updateWindow = null;

    private const string doTranslateSnapKey = "AutoSnap_doSnapKey";
    private const string doScaleSnapKey = "AutoSmap_doScaleSnapKey";
    private const string doRotateSnapKey = "AutoSnap_doRotateSnapKey";
    private const string snapScaleValueKey = "AutoSnap_snapScaleValueKey";
    private const string snapTranslateValueKey = "AutoSnap_snapTranslateValueKey";
    private const string snapRotateValueKey = "AutoSnap_snapRotateValueKey";

    [MenuItem("Edit/Auto Snap %_l")]

    static void Init()
    {
        // Debug.Log("AutoSnap: Init");

        AutoSnap window = (AutoSnap)EditorWindow.GetWindow(typeof(AutoSnap));
        window.maxSize = new Vector2(200, 125);
        window.Show();
    }

    public void OnGUI()
    {
        // Debug.Log("AutoSnap: OnGUI");

        doTranslateSnap = EditorGUILayout.Toggle("Snap Translation", doTranslateSnap);
        doScaleSnap = EditorGUILayout.Toggle("Snap Scale", doScaleSnap);
        doRotateSnap = EditorGUILayout.Toggle("Snap Rotation", doRotateSnap);

        snapTranslateValue = EditorGUILayout.FloatField("Translate Snap Value", snapTranslateValue);
        snapScaleValue = EditorGUILayout.FloatField("Scale Snap Value", snapScaleValue);
        snapRotateValue = EditorGUILayout.FloatField("Rotation Snap Value", snapRotateValue);
    }

    public void Update()
    {
        if (!EditorApplication.isPlaying && Selection.transforms.Length != 0)
        {
            // Debug.Log("AutoSnap: Update");

            if (doTranslateSnap
                && Selection.transforms[0].position != prevPosition)
            {
                TranslateSnap();
                prevPosition = Selection.transforms[0].position;
            }

            if (doScaleSnap
                && Selection.transforms[0].localScale != prevScale)
            {
                ScaleSnap();
                prevScale = Selection.transforms[0].localScale;
            }

            if (doRotateSnap
                && Selection.transforms[0].eulerAngles != prevRotation)
            {
                RotateSnap();
                prevRotation = Selection.transforms[0].eulerAngles;
            }
        }
    }

    private void TranslateSnap()
    {
        // Debug.Log("AutoSnap: Snap");

        foreach (var transform in Selection.transforms)
        {
            var t = transform.transform.position;
            t.x = TranslateRound(t.x);
            t.y = TranslateRound(t.y);
            t.z = TranslateRound(t.z);
            transform.transform.position = t;
        }
    }

    private void ScaleSnap()
    {
        // Debug.Log("AutoSnap: ScaleSnap");

        foreach (var transform in Selection.transforms)
        {
            var s = transform.transform.localScale;
            s.x = ScaleRound(s.x);
            s.y = ScaleRound(s.y);
            s.z = ScaleRound(s.z);
            transform.transform.localScale = s;
        }
    }

    private void RotateSnap()
    {
        // Debug.Log("AutoSnap: RotateSnap");

        foreach (var transform in Selection.transforms)
        {
            var r = transform.transform.eulerAngles;
            r.x = RotateRound(r.x);
            r.y = RotateRound(r.y);
            r.z = RotateRound(r.z);
            transform.transform.eulerAngles = r;
        }
    }

    private float ScaleRound(float input)
    {
        return snapScaleValue * Mathf.Round((input / snapScaleValue));
    }

    private float TranslateRound(float input)
    {
        return snapTranslateValue * Mathf.Round((input / snapTranslateValue));
    }

    private float RotateRound(float input)
    {
        return snapRotateValue * Mathf.Round((input / snapRotateValue));
    }

    public void OnEnable()
    {
        // Debug.Log("AutoSnap: OnEnable");

        if (EditorPrefs.HasKey(doTranslateSnapKey))
        {
            doTranslateSnap = EditorPrefs.GetBool(doTranslateSnapKey);
        }

        if (EditorPrefs.HasKey(doScaleSnapKey))
        {
            doScaleSnap = EditorPrefs.GetBool(doScaleSnapKey);
        }

        if (EditorPrefs.HasKey(doRotateSnapKey))
        {
            doRotateSnap = EditorPrefs.GetBool(doRotateSnapKey);
        }

        if (EditorPrefs.HasKey(snapScaleValueKey))
        {
            snapScaleValue = EditorPrefs.GetFloat(snapScaleValueKey);
        }

        if (EditorPrefs.HasKey(snapTranslateValueKey))
        {
            snapTranslateValue = EditorPrefs.GetFloat(snapTranslateValueKey);
        }

        if (EditorPrefs.HasKey(snapRotateValueKey))
        {
            snapRotateValue = EditorPrefs.GetFloat(snapRotateValueKey);
        }

        // Here, if a previous auto snap window was doing updates,
        // remove it
        if (updateWindow != null)
        {
            EditorApplication.update -= updateWindow.Update;
        }

        // Now make this window handle the updates
        EditorApplication.update += Update;
    }

    public void OnDisable()
    {
        Debug.Log("AutoSnap: OnDisable");

        EditorPrefs.SetBool(doTranslateSnapKey, doTranslateSnap);
        EditorPrefs.SetBool(doScaleSnapKey, doScaleSnap);
        EditorPrefs.SetBool(doRotateSnapKey, doRotateSnap);
        EditorPrefs.SetFloat(snapTranslateValueKey, snapTranslateValue);
        EditorPrefs.SetFloat(snapScaleValueKey, snapScaleValue);
        EditorPrefs.SetFloat(snapRotateValueKey, snapRotateValue);

        // Remember we're doing the updates
        updateWindow = this;

        // Normally you'd remove the window, however we don't
        // as we want the snapping to continue when this window is closed
        //EditorApplication.update -= Update;
    }
}