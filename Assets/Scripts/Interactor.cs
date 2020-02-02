using System.Collections;
using System.Collections.Generic;
using UnityEngine;
    
public class Interactor : MonoBehaviour
{
    public float raydistance;
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

    public void FreezeMovement(bool value)
    {
        controller.enableCameraMovement = !value;
        controller.playerCanMove = !value;
        controller.FreeCursor(value);
    }

    void Teleport(Vector3 position, bool cantp)
    {
        if(cantp) transform.position = position;
    }

    void EnterConversation(Actor actor)
    {
        //Debug.Log(actor.character.name);
        storyManager.ShowUI(true);
        storyManager.LoadChunk(actor.character.sceneName);

        int voice = Random.Range(1, actor.character.voices.Count);
        actor.character.voices[voice].
    }

    void SelectActor()
    {
        Ray selector = camera.ViewportPointToRay(Vector3.one / 2f);
        RaycastHit hit;
        if (Physics.Raycast(selector, out hit, raydistance, layerMask))
        {
            Actor actor = hit.collider.GetComponent<Actor>();
            Teleporter tp = hit.collider.GetComponent<Teleporter>();
            if (actor != null && Input.GetKeyDown(interact_key))
            {
                EnterConversation(actor);
            }
            if (tp != null && Input.GetKeyDown(interact_key))
            {
                Teleport(tp.destination.position, tp.canTeleport);
            }
        }
    }
}
