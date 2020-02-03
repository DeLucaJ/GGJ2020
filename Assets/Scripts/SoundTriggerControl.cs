using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SoundTriggerControl : MonoBehaviour
{
    //public AudioSource loopClip;
    //public AudioSource introClip;

    public AudioSource loopSong;
    public AudioSource introSong;
    //public AudioSource audio1;

    public GameObject Player; //Player.transform.position

    public Collider Collider1;
    private Vector3 center1;
    private Vector3 size1, min1, max1;
    private bool isPlaying = false;
    

    private void Start()
    {

        //AudioSource audio1 = GetComponent<AudioSource>();
        

        //Collider1 = GetComponent<Collider>();
        //center1 = Collider1.bounds.center;
        //size1 = Collider1.bounds.size;
        //min1 = Collider1.bounds.min;
        //max1 = Collider1.bounds.max;
    }

    //private void OnTriggerEnter(Collider other)
    //{
    //    StartCoroutine("PlaySongs");
    //}
    public void Update()
    {
        InCenter();
    }
    public void InCenter()
    {
        //introSong.Play();
        //yield return new WaitForSeconds(introSong.clip.length);
        //loopSong.Play();
        Vector3 trigger_pos = gameObject.transform.position;
        Vector3 box_scale = gameObject.transform.localScale;
        float x_delta = box_scale.x / 2;
        float z_delta = box_scale.z / 2;
        float min_x = trigger_pos.x - x_delta;
        float max_x = trigger_pos.x + x_delta;
        float min_z = trigger_pos.z - z_delta;
        float max_z = trigger_pos.z + z_delta;
        Vector3 player_pos = Player.transform.position;
        if (player_pos.x > min_x && player_pos.x < max_x && player_pos.z > min_z && player_pos.z < max_z)
        {
            if (!isPlaying) StartCoroutine("PlaySongs");
            
        }
        else
        {
            loopSong.Stop();
            introSong.Stop();
            isPlaying = false;
        }

    }
    IEnumerator PlaySongs()
    {
        isPlaying = true;
        introSong.Play();
        yield return new WaitForSeconds(introSong.clip.length);
        introSong.Stop();
        loopSong.Play();
        //audio1.Play();
        //yield return new WaitForSeconds(audio1.clip.length);
        //audio1.clip = loopClip;
        //audio1.Play();
        //audio1.loop = true;
    }
}
