using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Interactor : MonoBehaviour
{
    public KeyCode interact_key;
    public Camera camera;
    public LayerMask layerMask;
    public StoryManager storyManager;
    public FirstPersonAIO controller;

    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        SelectActor();
    }

    void SelectActor()
    {
        Ray selector = camera.ViewportPointToRay(Vector3.one / 2f);
        RaycastHit hit;
        if (Physics.Raycast(selector, out hit, 2f, layerMask))
        {
            Actor actor = hit.collider.GetComponent<Actor>();
            if (actor != null && Input.GetKeyDown(interact_key))
            {
                Debug.Log(actor.character.name);
                controller.enableCameraMovement = false;
                controller.playerCanMove = false;
                controller.FreeCursor(true);
                storyManager.ShowUI(true);
                storyManager.LoadChunk(actor.character.sceneName);
            }
        }
    }
}
