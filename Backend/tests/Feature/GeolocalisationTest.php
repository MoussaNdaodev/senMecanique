<?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Models\User;
use App\Models\Geolocalisation;
use Illuminate\Foundation\Testing\RefreshDatabase;

class GeolocalisationTest extends TestCase
{
    use  RefreshDatabase;

    protected string $endpoint = '/api/geolocalisations';
    protected string $tableName = 'geolocalisations';

    public function setUp(): void
    {
        parent::setUp();
    }

    public function testCreateGeolocalisation(): void
    {
        $this->markTestIncomplete('This test case needs review.');

        $this->actingAs(User::factory()->create());

        $payload = Geolocalisation::factory()->make([])->toArray();

        $this->json('POST', $this->endpoint, $payload)
             ->assertStatus(201)
             ->assertSee($payload['name']);

        $this->assertDatabaseHas($this->tableName, ['id' => 1]);
    }

    public function testViewAllGeolocalisationsSuccessfully(): void
    {
        $this->markTestIncomplete('This test case needs review.');

        $this->actingAs(User::factory()->create());

        Geolocalisation::factory(5)->create();

        $this->json('GET', $this->endpoint)
             ->assertStatus(200)
             ->assertJsonCount(5, 'data')
             ->assertSee(Geolocalisation::find(rand(1, 5))->name);
    }

    public function testViewAllGeolocalisationsByFooFilter(): void
    {
        $this->markTestIncomplete('This test case needs review.');

        $this->actingAs(User::factory()->create());

        Geolocalisation::factory(5)->create();

        $this->json('GET', $this->endpoint.'?foo=1')
             ->assertStatus(200)
             ->assertSee('foo')
             ->assertDontSee('foo');
    }

    public function testsCreateGeolocalisationValidation(): void
    {
        $this->markTestIncomplete('This test case needs review.');

        $this->actingAs(User::factory()->create());

        $data = [
        ];

        $this->json('post', $this->endpoint, $data)
             ->assertStatus(422);
    }

    public function testViewGeolocalisationData(): void
    {
        $this->markTestIncomplete('This test case needs review.');

        $this->actingAs(User::factory()->create());

        Geolocalisation::factory()->create();

        $this->json('GET', $this->endpoint.'/1')
             ->assertSee(Geolocalisation::first()->name)
             ->assertStatus(200);
    }

    public function testUpdateGeolocalisation(): void
    {
        $this->markTestIncomplete('This test case needs review.');

        $this->actingAs(User::factory()->create());

        Geolocalisation::factory()->create();

        $payload = [
            'name' => 'Random'
        ];

        $this->json('PUT', $this->endpoint.'/1', $payload)
             ->assertStatus(200)
             ->assertSee($payload['name']);
    }

    public function testDeleteGeolocalisation(): void
    {
        $this->markTestIncomplete('This test case needs review.');

        $this->actingAs(User::factory()->create());

        Geolocalisation::factory()->create();

        $this->json('DELETE', $this->endpoint.'/1')
             ->assertStatus(204);

        $this->assertEquals(0, Geolocalisation::count());
    }
    
}
