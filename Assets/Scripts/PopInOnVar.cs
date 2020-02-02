using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PopInOnVar : MonoBehaviour
{
    public Vector3 destination;
    public StoryManager sm;
    public string popinVariable;
    private bool hasPopped = false;

    void Update()
    {
        if (!hasPopped) CheckVariable();
    }
    void CheckVariable()
    {
        if (((int)sm.story.variablesState[popinVariable]) > 0)
        {
            hasPopped = true;
            transform.position = destination;
        }
    }
}
